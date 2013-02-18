// Copyright (c) 2007 Jim R. Wilson
// Copyright (c) 2010 Martin Monperrus
// @see http://www.jimbojw.com/wiki/index.php?title=SWFHttpRequest_Flash/Ajax_Utility
// @see http://www.monperrus.net/martin/cross-domain+ajax+with+http+post+for+sending+large+amount+of+data
// 
// Compile: $ haxe -main SWFHttpRequest -swf swfhttprequest.swf -swf-version 10
//
// Permission is hereby granted, free of charge, to any person 
// obtaining a copy of this software and associated documentation 
// files (the "Software"), to deal in the Software without 
// restriction, including without limitation the rights to use, 
// copy, modify, merge, publish, distribute, sublicense, and/or 
// sell copies of the Software, and to permit persons to whom the 
// Software is furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be 
// included in all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
// OTHER DEALINGS IN THE SOFTWARE.
// --------------------------------------------------------------------
//

import flash.external.ExternalInterface;
//import flash.Lib; // commented out to strip down the resulting flash
import haxe.Http;

class SWFHttpRequest {

    public static var ver:String = '0.3';

    public static var transports:Hash<Transport> = new Hash();

    public static function abort( instance:Int ) {
        transports.get( instance + '' ).abort();
    }
    
    public static function open( instance:Int, method:String, url:String ) {
        transports.set( instance + '', new Transport( instance, method, url ) );
    }
    
    public static function send( instance:Int, data:String ) {
        transports.get( instance + '' ).send( data );
    }

    public static function setRequestHeader( instance:Int, header:String, value:String ) {
        transports.get( instance + '' ).setRequestHeader( header, value );
    }
    
    public static function version() {
        return ver;
    }

    public static function main() {
        // required, thanks to a comment on the webpage of SWFHttpRequest
        flash.system.Security.allowDomain("*");
        ExternalInterface.addCallback("abort",abort);
        ExternalInterface.addCallback("open",open);
        ExternalInterface.addCallback("send",send);
        ExternalInterface.addCallback("setRequestHeader",setRequestHeader);
        ExternalInterface.addCallback("SWFHttpRequestVersion",version);
        ExternalInterface.call( [ "(function(){",
            "if (window.SWFHttpRequest) return;",
            "var Class = function(properties){",
                "var klass = function(){ return this.abort.apply(this); };",
                "klass.prototype = properties;",
                "klass.constructor = arguments.callee;",
                "return klass;",
            "};",
            "window.SWFHttpRequest = new Class({",
                "abort: function(){",
                    "if (typeof this.instance != 'undefined') {",
                        "window.SWFHttpRequest.instances[this.instance] = null;",
                        "window.SWFHttpRequest.engine.abort( this.instance );",
                    "}",
                    "this.readyState = 0;",
                    "this.responseText = '';",
                    "this.responseXML = null;",
                    "this.status = 0;",
                    "this.statusText = '';",
                    "this.instance = window.SWFHttpRequest.instances.length;",
                    "window.SWFHttpRequest.instances.push( this );",
                "},",
                "getAllResponseHeaders: function(){ return null; },",
                "getResponseHeader: function(){ return null; },",
                "onreadystatechange: null,",
                "open: function(method, url, async, user, password){",
                    "this.status = 0;",
                    "this.readyState = 1;",
                    "this.statusText = this.responseText = '';",
                    "this.responseXML = null;",
                    "window.SWFHttpRequest.engine.open( this.instance, method, url );",
                "},",
                "send: function(data){",
                    // TODO: Once haxe.Http supports setPostData() for flash9 targets, this function
                    // should be updated to allow for a Document as the data.  When that's the case,
                    // it should be serialized as XML prior to sending over to the Flash executor.
                    "window.SWFHttpRequest.engine.send( this.instance, data );",
                "},",
                "setRequestHeader: function(header, value){",
                    "if (this.readyState != 1 || !header || !value) return;",
                    "window.SWFHttpRequest.engine.setRequestHeader( this.instance, header, value );",
                "}",
            "});",
            "window.SWFHttpRequest.instances = [];",
            "window.SWFHttpRequest.version = '" + ver + "';",
            "var f = function(tag){",
                "var elems = document.getElementsByTagName(tag);",
                "for (var i=0; i<elems.length; i++) if (elems[i].SWFHttpRequestVersion) return elems[i];",
            "};",
            "window.SWFHttpRequest.engine = f('embed') || f('object');",
        "})" ].join('') );
        //var params = Lib.current.loaderInfo.parameters;
        //if (Reflect.hasField(params,'onload')) ExternalInterface.call( Reflect.field(params,'onload') );
    }
    
}

class Transport {

    var active:Bool;
    var instance:Int;
    var method:String;
    var url:String;
    var http:Http;

    public function new( instance:Int, method:String, url:String ) {
        ExternalInterface.call('(function(val){if (console) { console.log("SWFHttpRequest calling: "+val); }})',url);
        this.active = true;
        this.instance = instance;
        this.method = method.toUpperCase();
        this.url = url;
        this.http = new Http( this.url );
        this.http.onData = this.onData;
        this.http.onError = this.onError;
        this.http.onStatus = this.onStatus;
    }
    
    public function send( ?data:String ) {
        if ( data==null ) return this.http.request( this.method=='POST' );
        // NOTE: Once haxe.Http supports the setPostData() method for flash9 targets,
        // all the following should be replaced by: this.http.setPostData( data );
        var re = ~/^(.*?)=(.*)$/;
        var pairs:Array<String> = data.split('&');
        var ud = function(s){
            try { return StringTools.urlDecode(s); }
            catch ( e:Dynamic ) { }
            return s;
        };
        for( i in 0...pairs.length ) {
            if (re.match(pairs[i])) this.http.setParameter( ud(re.matched(1)), ud(re.matched(2)) );
            else this.http.setParameter( ud(pairs[i]), '' );
        }
        return this.http.request( this.method=='POST' );
    }
    
    public function setRequestHeader( header:String, value:String ) {
        this.http.setHeader( header, value );
    }
    
    public function onData( sdata:String ) {
        var data : String = StringTools.replace(sdata,"\\n","\\\n");
        data = StringTools.replace(data,"\\r","");
        if (!this.active) return;
        //ExternalInterface.call('(function(v){if (console) { console.log("SWFHttpRequest calling:"+v); }})',data);
        ExternalInterface.call( [ "(function(instance, data){",
            "var shr = window.SWFHttpRequest.instances[instance];",
            "if (!shr) return;",
            "shr.status = 200;",
            "shr.statusText = 'OK';",
            "shr.readyState = 4;",
            "shr.responseText = data;",
            "try {",
                "if (window.DOMParser) {",
                    "var dp = new DOMParser();",
                    "shr.responseXML = dp.parseFromString( data, 'text/xml' );",
                "} else {",
                    "shr.responseXML = new ActiveXObject('Microsoft.XMLDOM');",
                    "shr.responseXML.async = 'false';",
                    "shr.responseXML.loadXML(data);",
                "}",
            "} catch(error) { shr.responseXML = null; }",
            "if (shr.onreadystatechange && typeof shr.onreadystatechange=='function') shr.onreadystatechange();",
        "})" ].join(''), this.instance,         
        data
        );
    }
    
    public function onError( msg:String ) {
        if (!this.active) return;
        ExternalInterface.call( [ "(function(instance, msg){",
            "var shr = window.SWFHttpRequest.instances[instance];",
            "if (!shr) return;",
            "shr.status = 403;",// hack for JSKommment
            "shr.statusText = msg;",
            "shr.readyState = 4;",
            "shr.responseText = null;",
            "shr.responseXML = null;",
            "if (shr.onreadystatechange && typeof shr.onreadystatechange=='function') shr.onreadystatechange();",
        "})" ].join(''), this.instance, msg );
    }
    
    public function onStatus( status:Int ) {
        if (!this.active || status==200) return;
        ExternalInterface.call( [ "(function(instance, status){",
            "var shr = window.SWFHttpRequest.instances[instance];",
            "if (!shr) return;",
            "shr.status = status;",
            "if (shr.onreadystatechange && typeof shr.onreadystatechange=='function') shr.onreadystatechange();",
        "})" ].join(''), this.instance, status );
    }
    
    public function abort() {
        this.active = false;
    }

}

