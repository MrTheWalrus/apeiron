var Apeiron = {};

(function() {

  "use strict";

  var self = Apeiron.home = {};

  var $log;
  var $visual;
  var logLimit = 12; //max number of lines in log at a time.
  var sessionId;
  var status = 'offline';

  self.onDocumentReady = function() {
    initVars();
    setStatus('offline', 'System Offline. Press any key to begin boot sequence.');
    $(document).keydown(keyHandler);
  }

  // TODO: Someday maybe the text doesn't live here? 
  function bootUp(){
    sessionId = Math.random().toString(16).substring(2,14).toUpperCase();
    var bootLines = [
      ['SGCOS Modular BIOS Rev. 0102-Omega (c)2003 USAF', 1000],
      ['Running Security Self-Check', 2000],
      ['Checksum <span class="good">OK</span>', 250],
      ['Input device: Keyboard: <span class="good">OK</span>', 250],
      ['Input device: Pointer: <span class="good">OK</span>', 250],
      ['Output device: Mk5 Optical Interface Crystal: <span class="good">OK</span>', 250]
    ]
    // Half of the time, there's a problem with the OIC config and it needs to be rebuilt
    if(Math.random()>0.5){
      $.merge(bootLines, [
        ['Input device: Mk5 Optical Interface Crystal: <span class="warn">NO_CONFIG</span>', 500],
        ['OIC configuration is stale. Generating new configuration. Please wait...', 2000],
        ['Beginning manual OIC pulse test', 1000],
        ['sending 0.', 100],
        ['received 1, sending 1', 101],
        ['received 2, sending 3', 103],
        ['received 5, sending 8', 105],
        ['received 13, sending 21', 121],
        ['received 34. Sequence complete. Writing OIC config...', 800]
      ]);
    }
    $.merge(bootLines, [
      ['Input device: Mk5 Optical Interface Crystal: <span class="good">OK</span>', 800],
      ['Running Alexandria 2.5 - Compiling opcode libraries.', 1000],
      [' + lib_apeiron_v0.11b', 600],
      [' + - lib_secunda_v0.11b', 300],
      [' + - lib_ancient_technical_v0.1.4', 800],
      [' + - - lib_ancient_base_v0.9.13', 800],
      [' + - - lib_stargate_v0.8.4', 750],
      [' + lib_systems_gui_0.6.3', 300],
      ['Library build successful.', 250],
      ['Sending Apeiron systems handshake, ID '+sessionId, 1000],
      ['Session '+sessionId+' confirmed. Interlink ready.', 600],
      ['Initializing Graphical Interface...', 600]
    ]);
    setStatus('booting', "Beginning system boot.")
    logLines(bootLines);
    $log.one('finished', initGUI);
  };

  function shutDown(){
    $visual.fadeOut('fast', function(){
      $visual.html('');
    });
    setStatus('shutdown', "Shutting Down");
    logLines([
      ['System Shutdown Initiated. Deactivating Interlink.', 2000],
      ['Interlink offline. Goodbye...', 750]
      ]);
    $log.one('finished', function(){
      $log.html('');
      setStatus('offline', 'System Offline. Press any key to begin boot sequence.');
    })
  }

  function initGUI(){
    setStatus('running', "System Online. Session ID:"+sessionId+". Interlink Active.");
    // TODO: Actual visual content?
    $visual.html("<p>Look, if wishes were horses we'd all be eating steak.</p><p>There's nothing here.</p>");
    $visual.fadeIn();
  }

  function keyHandler(event){
    console.log(event.which);
    if(status === 'offline'){
      bootUp();
    }
    if(status === 'running'){
      if(event.which === 27){
        shutDown();
      }
    }
  }

  function setStatus(code, message){
    status = code;
    $('.status').text(message);
  }

  function initVars(){
    $log = $('ul.log');
    $visual = $('div.visual');
  }

  function logLine(content) {
    if($("ul.log li").length >= logLimit) {
      $("ul.log li").first().remove();
    }
    $log.append('<li>'+content+'</li>');
  }

  function logLines(lines) {
    var elapsed = 0;
    $.each(lines, function(index, line){
      setTimeout(function(){logLine(line[0])}, elapsed);
      elapsed += line[1];
    });
    setTimeout(function(){$log.trigger('finished')}, elapsed);
  }


}());

$(document).ready(function() {
  Apeiron.home.onDocumentReady();
});