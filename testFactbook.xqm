(:~
 : ce module est une expérimentation avec les annotations RESTXQ
 : @author Philippe Pons et Emmanuel Chateau
 :)
module namespace fact = 'http://basex.org/modules/web-page';


declare
  %restxq:path("/{$pays}")
function fact:accueil($pays as xs:string) {
    let $titre := "titre"
    let $fonction := db:open("factbook")//country[string(@name)=$pays]/name
    return fact:template($fonction, $titre)
    };




declare function fact:template($fonction, $titre) as element(Q{http://www.w3.org/1999/xhtml}html) { 
  <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>{$titre}</title>
      <link rel="stylesheet" type="text/css" href="static/style.css"/>
    </head>
    <body>
      <div class="right"><img src="static/basex.svg" width="96"/></div>
      <h2>{$titre}</h2>
      <div>
      <p>{$fonction}</p>
      </div>
    </body>
  </html>
};
