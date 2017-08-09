(function () {
  "use strict";

  var self = Apeiron.Systems.offensive = {};

  self.onDocumentReady = function(){
    Apeiron.home.logLines([
      ["<span class='heading'>Offensive System Registry</span>", 100],
      ["System Registry 0: <i>Apis</i>", 500],
      [" - Launcher Bank Alpha:&nbsp;&nbsp;&nbsp;<span class='good report-status'>Online</span> &nbsp;Launchers loaded: <span class='good'>5/5</span> &nbsp;Ammunition reserve: <span class='warn'>7</span>", 100],
      [" - Launcher Bank Beta:&nbsp&nbsp&nbsp&nbsp<span class='good report-status'>Online</span> &nbsp;Launchers loaded: <span class='good'>5/5</span> &nbsp;Ammunition reserve: <span class='warn'>7</span>", 100],
      [" - Launcher Bank Gamma:&nbsp&nbsp&nbsp<span class='good report-status'>Online</span> &nbsp;Launchers loaded: <span class='good'>5/5</span> &nbsp;Ammunition reserve: <span class='warn'>7</span>", 100],
      [" - Launcher Bank Delta:&nbsp&nbsp&nbsp<span class='bad report-status'>Offline - Launchers damaged.</span>", 100],
      [" - Launcher Bank Epsilon:&nbsp<span class='good report-status'>Online</span> &nbsp;Launchers loaded: <span class='good'>5/5</span> &nbsp;Ammunition reserve: <span class='warn'>8</span>", 100],
      ["System Registry 2: XM-553S Railgun System", 250],
      [" - Fire Control Linkages: <span class='good'>Online</span> ", 250],
      [" - <span class='warn'> 1/4</span> turrets online", 100]
    ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('systems');
    });
  }
}());