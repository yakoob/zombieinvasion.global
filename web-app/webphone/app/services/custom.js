/*
 * HACKING TRYIT
 * #############
 * 
 *
 *
 * You may want to replicate Tryit JsSIP demo web into your server and maybe
 * use it with your own modified version of JsSIP. To achieve it follow the
 * following steps.
 *
 *
 *
 * Retrieve Tryip JsSIP web code
 * -----------------------------
 *
 * In your *nix WWW server retrieve the full code and files of Tryit JsSIP
 * by running:
 *
 *   wget -rN http://tryit.jssip.net ; wget -rN http://tryit.jssip.net/sounds
 *
 * This will generate a directory "tryit.jssip.net" in the path where you run
 * the command. The option -N means that just modified files in the server
 * will be downloaded (useful if you run such a command in a cron job for
 * having your Tryit app in sync with the official Tryit JsSIP app).
 *
 *
 * Copy this file js/custom.REMOVE_THIS.js to js/custom.js
 * -------------------------------------------------------
 *
 * Edit js/custom.js and set the variables below at your convenience.
 *
 */



// CustomJsSIP allows you indicating Tryit to use a different URL for
// retrieving JsSIP library (useful if you want to use your own).
//
CustomJsSIP = "http://api.countrycode.org/zzTest/dd/tryit.jssip.net/js/jssip-0.3.0.js";
// CustomJsSIP = "http://my-server/my-jssip.js"


// Configure in CustomJsSIPSettings your custom settings for JsSIP so the web
// will inmediately login without filling the HTML form.
//
// Parameters with null value means "use parameter default value". Check the
// documentation at http://jssip.net/documentation/devel/api/ua_configuration_parameters/
//
CustomJsSIPSettings = {
   uri: 'sip:1001@alc-fsw24.ifn.com',
   password: '1234',
   ws_servers: 'ws://alc-fsw24.ifn.com:5066',
   display_name: 'Edward',
   authorization_user: '1001',
   register: false,
   register_expires: 600,
   no_answer_timeout: 60,
   trace_sip: true,
   stun_servers: 'stun:74.125.132.127:19302',
   turn_servers: null,
   use_preloaded_route: null,
   connection_recovery_min_interval: 30,
   connection_recovery_max_interval: 60,
   hack_via_tcp: null,
   hack_ip_in_contact: null
};

