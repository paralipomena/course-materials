xquery version "3.0";
 
(: Words spoken per speaker :)
 
declare namespace tei="http://www.tei-c.org/ns/1.0";
 
let $doc := fn:doc("db/shakespeare/Ado.xml")
for $character in fn:distinct-values($doc//tei:sp/tei:speaker/tei:w/text())
let $count := fn:count(
    for $speaker in $doc//tei:sp
    let $words := $speaker/tei:ab//tei:w/text()
    where $speaker/tei:speaker/tei:w/text() = $character
    return $words)
order by $count descending
return fn:concat($character, ", ", $count)