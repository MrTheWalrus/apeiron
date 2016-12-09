(function() {

  "use strict";

  var self = Apeiron.home = {};

  var $log;
  var $visual;
  var logLimit = 12; //max number of lines in log at a time.
  var sessionId;
  var status = 'offline';
  var interlinkActive = false;

  self.onDocumentReady = function() {
    initVars();
    setStatus('offline', 'System Offline. Press any key to begin boot sequence.');
    $(document).keydown(keyHandler);
  }

  // TODO: Maybe deduplicate these.
  self.logLine = function(line){
    logLine(line);
  }

  self.logLines = function(lines){
    logLines(lines);
  }

  self.setStatus = function(st, message){
    setStatus(st, message);
  }

  function startInterlink(){
    setStatus('loading', 'Initializing Apeiron Systems Interlink')
    sessionId = Math.random().toString(16).substring(2,14).toUpperCase();

    var interlinkLines = [
      ['Establishing interlink with Apeiron core systems.', 500],
      ['Output device: Mk5 Optical Interface Crystal: <span class="good">OK</span>', 250]
    ]
    // Half of the time, there's a problem with the OIC config and it needs to be rebuilt
    if(Math.random()>0.5){
      $.merge(interlinkLines, [
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
    $.merge(interlinkLines, [
      ['Input device: Mk5 Optical Interface Crystal: <span class="good">OK</span>', 800],
      ['Running Alexandria 2.5 - Compiling opcode libraries.', 1000],
      [' + lib_apeiron_v0.11b', 600],
      [' + - lib_secunda_v0.11b', 300],
      [' + - lib_ancient_technical_v0.1.4', 800],
      [' + - - lib_ancient_base_v0.9.13', 800],
      [' + - - lib_stargate_v0.8.4', 750],
      [' + lib_systems_gui_0.6.3', 300],
      ['Library build successful. 2 items, 4 dependencies.', 250],
      ['Sending Apeiron systems handshake, ID '+sessionId, 1000],
      ['Session '+sessionId+' confirmed. Interlink ready.', 600],
      ['Initializing Ship System Visual Interface...', 600]
    ]);
    logLines(interlinkLines);
    $log.one('finished', function(){
      interlinkActive = true;
      setStatus('running', "System Running. Interlink active, session ID "+sessionId);
      displaySystems();
    })
  }

  // TODO: Someday maybe the text doesn't live here? 
  function bootUp(){
    var bootLines = [
      ['SGCOS Modular BIOS Rev. 0103-Omega (c)2003 USAF', 1000],
      ['Testing System Memory: <span class=good>256000000 bytes OK</span>', 100],
      ['Memory Clock: <span class=good>266 MHz Tcl:5 Tcrd:7 Trp:7</span>', 300],
      ['Running Security Self-Check', 1900],
      ['Checksum <span class="good">OK</span>', 250],
      ['Local Storage: <span class=good>SATA 1: ATAP1 iHAS160</span>', 200],
      ['Input device: Keyboard: <span class="good">OK</span>', 250],
      ['Input device: Pointer: <span class="good">OK</span>', 250],
      ['Apeiron Interlink: <span class="bad">Offline</span>', 250],
    ];
    $visual.fadeIn(2000);
    setStatus('booting', "Beginning system boot.");
    logLines(bootLines);
    $log.one('finished', function(){
      displayMenu();
    });
  };

  function displayMenu(){
    var menuLines = [
      ["<span class='heading'>Main System Menu</span>", 300],
      ["[<span class='key'>ESC</span>]: Shut down system", 100],
      ["[<span class='key'>1</span>]: Project Tracking", 100],
      ["[<span class='key'>2</span>]: Intel Report", 100]
    ];
    if(interlinkActive){
      menuLines.push(["[<span class='key'>3</span>]: Apeiron Systems Interface", 5]);
    }else{
      menuLines.push(["[<span class='key'>3</span>]: Initiate Apeiron Interlink", 5]);
    }
    logLines(menuLines);
    $log.one('finished', function(){
      if(interlinkActive){
        setStatus('main menu', "System Running. Interlink active, session ID "+sessionId+".");
      }else{
        setStatus('main menu', "System Running. Interlink offline.");
      }
    })
  }

  function shutDown(){
    $visual.fadeOut('slow', function(){
      $visual.html('');
    });
    setStatus('shutdown', "Shutting Down");
    var shutdownLines = [
      ['System shutdown initiated.', 2000]
    ]
    if(interlinkActive){
      shutdownLines.push(["Deactivating Interlink", 1000]);
      interlinkActive = false;
    }
    shutdownLines.push(['Shutdown complete. Goodbye...', 750]);

    logLines(shutdownLines);
    $log.one('finished', function(){
      $log.html('');
      setStatus('offline', 'System Offline. Press any key to begin boot sequence.');
    })
  }

  function displaySystems(){
    setVisual('/systems/overview');
    setStatus('systems');
    $visual.fadeIn('slow');

  }

  // TODO: Figure out structure for subclass key handlers
  function keyHandler(event){
    console.log(status + ' ' + event.which);
    if(status === 'offline'){
      bootUp();
    }
    if(status === 'main menu'){
      switch(event.which){
        case 27: //Esc
          shutDown();
          break;
        case 49: //1
          logLine('Loading projects GUI...');
          setVisual('/projects');
          break;
        case 51: //3
          if(interlinkActive){
            displaySystems();
          }else{
            startInterlink();
          }
          break;
        case 50: //2
          logLine('Intel report not yet implemented.');
          break;
      }
    }
    if(status === 'systems'){
      switch(event.which){
        case 27: //Esc
          $visual.fadeOut('slow', function(){
            // TODO: Image tag it.
            $visual.html('<img alt="Sgc logo" height="300" src="/assets/sgc_logo.png">');
            $visual.fadeIn('slow');
          });
          displayMenu();
          break;
        case 80: //P
          setVisual('systems/power');
          break;
        case 83: //S
          setVisual('systems/structural');
          break;
        case 73: //I
          setVisual('systems/information');
          break;
        case 68: //D
          setVisual('systems/defensive');
          break;
        case 69: //E
          setVisual('systems/environmental');
          break;
        case 79: //O
          setVisual('systems/offensive');
          break;
        case 84: //T
          setVisual('systems/transit');
          break;
        case 13: //enter
          setVisual('systems/overview');
          break;
      }
    }
    if(status === 'projects'){
      switch(event.which){
        case 27: //Esc
          $visual.fadeOut('slow', function(){
            // TODO: Image tag it.
            $visual.html('<img alt="Sgc logo" height="300" src="/assets/sgc_logo.png">');
            $visual.fadeIn('slow');
          });
          displayMenu();
          break;
      }      
    }
  }

  function setVisual(path){
    setStatus('loading');
    $visual.fadeOut('fast', 'swing', function(){
      $visual.load(path, function(){
        $visual.fadeIn();
      });
    });
  }

  function setStatus(code, message){
    console.log(code);
    status = code;
    if(message){
      $('.status').text(message);
    }
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
      if($.isNumeric(elapsed)){elapsed += line[1]}; //Protect from NaN
    });
    setTimeout(function(){
      console.log('log finished '+elapsed);
      $log.trigger('finished');
    }, elapsed);
  }


}());

$(document).ready(function() {
  Apeiron.home.onDocumentReady();
});