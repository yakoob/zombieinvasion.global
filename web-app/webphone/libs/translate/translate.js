angular.module("pascalprecht.translate",["ng"]).run(["$translate",function(a){var b=a.storageKey(),c=a.storage();c?c.get(b)?a.uses(c.get(b)):angular.isString(a.preferredLanguage())?a.uses(a.preferredLanguage()):c.set(b,a.uses()):angular.isString(a.preferredLanguage())&&a.uses(a.preferredLanguage())}]),angular.module("pascalprecht.translate").constant("$STORAGE_KEY","NG_TRANSLATE_LANG_KEY"),angular.module("pascalprecht.translate").provider("$translate",["$STORAGE_KEY",function(a){var b,c,d,e,f,g,h,i,j={},k=a,l=".",m=function(a,b){if(!a&&!b)return j;if(a&&!b){if(angular.isString(a))return j[a];angular.extend(j,n(a))}else angular.isObject(j[a])||(j[a]={}),angular.extend(j[a],n(b))},n=function(a,b,c){var d,e,f;b||(b=[]),c||(c={});for(d in a)a.hasOwnProperty(d)&&(f=a[d],angular.isObject(f)?n(f,b.concat(d),c):(e=b.length?""+b.join(l)+l+d:d,c[e]=f));return c};this.translations=m,this.preferredLanguage=function(a){return a?(b=a,void 0):b},this.fallbackLanguage=function(a){return a?(c=a,void 0):c},this.uses=function(a){if(!a)return d;if(!j[a]&&!h)throw new Error("$translateProvider couldn't find translationTable for langKey: '"+a+"'");d=a};var o=function(a){return a?(k=a,void 0):f?f+k:k};this.storageKey=o,this.useUrlLoader=function(a){this.useLoader("$translateUrlLoader",{url:a})},this.useStaticFilesLoader=function(a){this.useLoader("$translateStaticFilesLoader",a)},this.useLoader=function(a,b){h=a,i=b||{}},this.useLocalStorage=function(){this.useStorage("$translateLocalStorage")},this.useCookieStorage=function(){this.useStorage("$translateCookieStorage")},this.useStorage=function(a){e=a},this.storagePrefix=function(a){return a?(f=a,void 0):a},this.useMissingTranslationHandlerLog=function(){this.useMissingTranslationHandler("$translateMissingTranslationHandlerLog")},this.useMissingTranslationHandler=function(a){g=a},this.$get=["$interpolate","$log","$injector","$rootScope","$q",function(a,f,k,l,n){var p,q=!1;if(e&&(p=k.get(e),!p.get||!p.set))throw new Error("Couldn't use storage '"+e+"', missing get() or set() method!");var r=function(b,e){var f=d?j[d]:j;if(f&&f.hasOwnProperty(b))return a(f[b])(e);if(g&&!q&&k.get(g)(b),d&&c&&d!==c){var h=j[c][b];if(h)return a(h)(e)}return b};return r.preferredLanguage=function(){return b},r.fallbackLanguage=function(){return c},r.storage=function(){return p},r.uses=function(a){if(!a)return d;var b=n.defer();return j[a]?(d=a,e&&p.set(r.storageKey(),d),b.resolve(d),l.$broadcast("translationChangeSuccess"),b.promise):(q=!0,k.get(h)(angular.extend(i,{key:a})).then(function(c){var f={};angular.isArray(c)?angular.forEach(c,function(a){angular.extend(f,a)}):angular.extend(f,c),m(a,f),d=a,e&&p.set(r.storageKey(),d),q=!1,l.$broadcast("translationChangeSuccess"),b.resolve(d)},function(a){l.$broadcast("translationChangeError"),b.reject(a)}),b.promise)},r.storageKey=function(){return o()},h&&angular.equals(j,{})&&r.uses(r.uses()),r}]}]),angular.module("pascalprecht.translate").directive("translate",["$filter","$interpolate",function(a,b){var c=a("translate");return{restrict:"A",scope:!0,link:function(a,d,e){e.$observe("translate",function(c){a.translationId=angular.equals(c,"")?b(d.text().replace(/^\s+|\s+$/g,""))(a.$parent):c}),e.$observe("values",function(b){a.interpolateParams=b}),a.$on("translationChangeSuccess",function(){d.html(c(a.translationId,a.interpolateParams))}),a.$watch("translationId + interpolateParams",function(b){b&&d.html(c(a.translationId,a.interpolateParams))})}}}]),angular.module("pascalprecht.translate").filter("translate",["$parse","$translate",function(a,b){return function(c,d){return angular.isObject(d)||(d=a(d)()),b(c,d)}}]);


angular.module('pascalprecht.translate')
/**
 * @ngdoc factory
 * @name pascalprecht.translate.factory:$translateUrlLoader
 * @requires $q
 * @requires $http
 *
 * @description
 * Creates a loading function for a typical static file url pattern:
 * "lang-en_US.json", "lang-de_DE.json", etc. Using this builder,
 * the response of these urls must be an object of key-value pairs.
 *
 * @param {object} options Options object, which gets prefix, suffix and key.
 */
    .factory('$translateStaticFilesLoader', ['$q', '$http', function ($q, $http) {

        console.log("$translateStaticFilesLoader: " );

        return function (options) {

            if (!options || (!options.prefix || !options.suffix)) {
                throw new Error('Couldn\'t load static files, no prefix or suffix specified!');
            }


            var deferred = $q.defer();

            console.log("$translateStaticFilesLoader loading url " );


            $http({
                url: [
                    options.prefix,
                    options.key,
                    options.suffix
                ].join(''),
                method: 'GET',
                params: ''
            }).success(function (data) {
                    deferred.resolve(data);
                }).error(function (data) {
                    deferred.reject(options.key);
                });

            return deferred.promise;
        };
    }]);