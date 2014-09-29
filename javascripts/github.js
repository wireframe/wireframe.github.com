---
---
(function() {
  // pull metadata about github repositories from jekyll
  // see http://www.carsonshold.com/2014/05/github-metadata-with-jekyll-and-javascript/
  var github = {{ site.github || jsonify }};

  // Put custom repo URL's in this object, keyed by repo name.
  var repoUrls = {
  };

  // Put custom repo descriptions in this object, keyed by repo name.
  var repoDescriptions = {
  };

  function repoUrl(repo) {
    return repoUrls[repo.name] || repo.html_url;
  }

  function repoDescription(repo) {
    return repoDescriptions[repo.name] || repo.description;
  }

  function addPopularRepo(repo) {
    var $item = $("<li>");
    var $link = $("<a>").attr("href", repoUrl(repo)).appendTo($item);
    if (repo.language) {
      // $link.append($("<span>").text('[' + repo.language.toLowerCase() + '] '));
    }
    $link.append($("<span>").text(repo.name));
    $item.append($("<span>").text(' - ' + repoDescription(repo)));
    $item.appendTo("#popular_repositories");
  }

  function addRepos(repos, page) {
    var repos = github.public_repositories;

    // Convert pushed_at to Date.
    $.each(repos, function (i, repo) {
      repo.pushed_at = new Date(repo.pushed_at);

      var weekHalfLife  = 1.146 * Math.pow(10, -9);

      var pushDelta    = (new Date) - Date.parse(repo.pushed_at);
      var createdDelta = (new Date) - Date.parse(repo.created_at);

      var weightForPush = 1;
      var weightForWatchers = 10;
      var weightForStars = 5;

      repo.hotness = 0;
      repo.hotness += weightForPush * Math.pow(Math.E, -1 * weekHalfLife * pushDelta);
      repo.hotness += weightForWatchers * repo.watchers;
      repo.hotness += weightForStars * repo.stargazers_count;
    });

    // Sort by popularity
    repos.sort(function (a, b) {
      if (a.hotness < b.hotness) return 1;
      if (b.hotness < a.hotness) return -1;
      return 0;
    });

    $.each(repos.slice(0, 10), function (i, repo) {
      addPopularRepo(repo);
    });
  }

  $(function() {
    if ($('#popular_repositories').length) {
      addRepos();
    }
  });
})();
