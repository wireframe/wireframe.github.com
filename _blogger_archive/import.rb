#! /usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'fileutils'
require 'date'
require 'uri'
require 'html2md'

# usage: ruby import.rb my-blog.xml
# my-blog.xml is a file from Settings -> Basic -> Export in blogger.

EXPORT_COMMENTS = false
data = File.read ARGV[0]
doc = Nokogiri::XML(data)

@posts = {}
@drafts = {}

def add(node)
  id = node.search('id').first.content
  type = node.search('category').first.attr('term').split('#').last
  case type
  when 'post'
    if published?(node)
      @posts[id] = Post.new(node)
    else
      @drafts[id] = Post.new(node)
    end
  when 'comment'
    reply_to = node.children.find {|c| c.name == 'in-reply-to' }
    post_id = reply_to.attr('ref')
    @posts[post_id].add_comment(Comment.new(node))
  when 'template', 'settings', 'page'
  else
    raise 'dunno '+type
  end
end

def published?(node)
  node.at_css('app|control app|draft', 'app' => 'http://purl.org/atom/app#').nil?
end

class Post
  attr_reader :comments
  def initialize(node)
    @node = node
    @comments = []
  end

  def add_comment(comment)
    @comments.unshift comment
  end

  def title
    @title ||= @node.at_css('title').content
  end

  def content
    @content ||= begin
      content = @node.at_css('content').content
      content = content.gsub('{', '&#123;').gsub('}', '&#125;')
      Html2Md.new(content).parse
    end
  end

  def creation_date
    @creation_date ||= creation_datetime.strftime("%Y-%m-%d")
  end

  def creation_datetime
    @creation_datetime ||= Date.parse(@node.search('published').first.content)
  end

  def permalink
    return @permalink unless @permalink.nil?

    link_node = @node.at_css('link[rel=alternate]')
    @permalink = link_node && link_node.attr('href')
  end

  def param_name
    if permalink.nil?
      title.split(/[^a-zA-Z0-9]+/).join('-').downcase
    else
      File.basename(URI(permalink).path, '.*')
    end
  end

  def file_name
    %{#{creation_date}-#{param_name}.md}
  end

  def header
    [
      '---',
      %{},
      %{title: "#{title.gsub('"', '\"')}"},
      %{date: #{creation_datetime}},
      %{comments: false},
      categories,
      '---'
    ].compact.join("\n")
  end

  def categories
    terms = @node.search('category[scheme="http://www.blogger.com/atom/ns#"]')
    unless Array(terms).empty?
      [
        'categories:',
        terms.map{ |t| t.attr('term') && " - #{t.attr('term')}" }.compact.join("\n"),
      ].join("\n")
    end
  end

  def write(path='_posts')
    file_path = File.join(path, file_name)
    puts %Q{Exporting post "#{title}" to #{file_path}...}

    if File.exists?(file_path)
      puts 'file already generated.'
      return
    end

    File.open(file_path, 'w') do |file|
      file.write header
      file.write "\n\n"
      file.write content

      if comments.any? && EXPORT_COMMENTS
        puts "Exporting #{comments.count} comments}
        file.write "<h2>Comments</h2>\n"
        file.write "<div class='comments'>\n"
        comments.reverse.each do |comment|
          file.write "<div class='comment'>\n"
          file.write "<div class='author'>"
          file.write comment.author
          file.write "</div>\n"
          file.write "<div class='content'>\n"
          file.write comment.content
          file.write "</div>\n"
          file.write "</div>\n"
        end
        file.write "</div>\n"
      end

    end
  end
end

class Comment
  def initialize(node)
    @node = node
  end

  def author
    @node.search('author name').first.content
  end

  def content
    @node.search('content').first.content
  end
end

entries = {}
doc.search('entry').each do |entry|
  add entry
end

puts "** Writing PUBLISHED posts"
Dir.mkdir("_posts") unless File.directory?("_posts")
@posts.each do |id, post|
  post.write
end

puts "\n"
puts "** Writing DRAFT posts"
Dir.mkdir("_drafts") unless File.directory?("_drafts")
@drafts.each do |id, post|
  post.write '_drafts'
end