(function () {
  "use strict";

  var self = Apeiron.Systems.offensive = {};

  self.onDocumentReady = function(){
    Apeiron.home.logLines([
      ["System Registry 0: <i>Apis</i>", 500],
      [" - Launcher Bank Alpha:&nbsp;&nbsp;&nbsp;<span class='good report-status'>Online</span> &nbsp;Launchers loaded: <span class='bad'>0/5</span> &nbsp;Ammunition reserve: <span class='bad'>0</span>", 100],
      [" - Launcher Bank Beta:&nbsp&nbsp&nbsp&nbsp<span class='good report-status'>Online</span> &nbsp;Launchers loaded: <span class='bad'>0/5</span> &nbsp;Ammunition reserve: <span class='bad'>0</span>", 100],
      [" - Launcher Bank Gamma:&nbsp&nbsp&nbsp<span class='good report-status'>Online</span> &nbsp;Launchers loaded: <span class='bad'>0/5</span> &nbsp;Ammunition reserve: <span class='bad'>0</span>", 100],
      [" - Launcher Bank Delta:&nbsp&nbsp&nbsp<span class='good report-status'>Online</span> &nbsp;Launchers loaded: <span class='bad'>0/5</span> &nbsp;Ammunition reserve: <span class='bad'>0</span>", 100],
      [" - Launcher Bank Epsilon:&nbsp<span class='good report-status'>Online</span> &nbsp;Launchers loaded: <span class='bad'>0/5</span> &nbsp;Ammunition reserve: <span class='bad'>0</span>", 100],
      ["System Registry 1: <span class='bad power-no-system'>&lt;Error: No such system/system not configured&gt;</span>", 200]
    ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('systems');
    });
  }
}());