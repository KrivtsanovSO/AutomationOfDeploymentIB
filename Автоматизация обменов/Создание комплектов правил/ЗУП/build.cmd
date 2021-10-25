chcp 1251

del toir\toir.zip
del zup\zup.zip

copy Rules\toir_zup.xml zup\CorrespondentExchangeRules.xml
copy Rules\zup_toir.xml zup\ExchangeRules.xml

copy Rules\toir_zup.xml toir\ExchangeRules.xml
copy Rules\zup_toir.xml toir\CorrespondentExchangeRules.xml

copy Rules\zup_RegistrationRules.xml zup\RegistrationRules.xml

"C:\Program Files\7-Zip\7z" a .\toir\toir.zip .\toir\*
"C:\Program Files\7-Zip\7z" a .\zup\zup.zip .\zup\*