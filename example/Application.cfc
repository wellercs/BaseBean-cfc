﻿component {
    // copy this to your application root to use as your Application.cfc
    // or incorporate the logic below into your existing Application.cfc

    // you can provide a specific application name if you want:
    this.name = hash( getBaseTemplatePath() );

    // any other application settings:
    this.sessionManagement = true;

    // set up per-application mappings as needed:
    this.mappings[ '/framework' ] = getDirectoryFromPath( getBaseTemplatePath() ) & 'framework';
    // this.mappings[ '/app' ] expandPath( '../path/to/app' );

    function _get_framework_one() {
        if ( !structKeyExists( request, '_framework_one' ) ) {

            // you can specify FW/1 configuration as an argument:
            request._framework_one = new framework.one({
                base = '/app',
                diOverrideAllowed = false,
                diEngine = "custom", // none, di1, aop1, wirebox, custom
                diLocations = "controllers, model",
                diConfig = {
                    omitDirectoryAliases : true
                },
                diComponent = "framework.ioc",
                trace = true
            });

            // if you need to override extension points, use
            // MyApplication.cfc for those and then do:
            // request._framework_one = new MyApplication({
            //     base : '/app',
            //     trace : true
            // });

        }
        return request._framework_one;
    }

    // delegation of lifecycle methods to FW/1:
    function onApplicationStart() {
        return _get_framework_one().onApplicationStart();
    }
    function onError( exception, event ) {
        return _get_framework_one().onError( exception, event );
    }
    function onRequest( targetPath ) {
        return _get_framework_one().onRequest( targetPath );
    }
    function onRequestEnd() {
        return _get_framework_one().onRequestEnd();
    }
    function onRequestStart( targetPath ) {
        return _get_framework_one().onRequestStart( targetPath );
    }
    function onSessionStart() {
        return _get_framework_one().onSessionStart();
    }
}