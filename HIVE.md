# flutter_kostlivec s https://docs.hivedb.dev/#/

## StateHolder
Bere jako nepovinný parametr:
* boxName - jméno HiveBoxu do kterého se stav ukládá při každé změně
* onLoad - void callback, který se zavolá potom, co je stav úspěšně nahrán z HiveBoxu

Pak pokud je boxName, tak při každé změně se stav serializuje a uloží
do HiveBoxu.

Vždy se serializuje pomocí serializeru z built_value, takže primitivní
typy apod, takže nejsou potřeba žádné Hive adaptéry.

## Další změny

### Není třeba PersistenState/PersistenceService

### BuildFlavor je EnumClass
Jelikož BuildFlavor je součástí ConfigState, který se serializuje, tak
jej oddědíme od built_value.EnumClass, a tím získáme serializer.

### Asynchronní load
U PersistenceService byl await než se vše nahraje. Teď není, takže se
nejprve vytvoří ten initial state, pak se vyvolá load, sestaví se UI,
pak doběhne load, ten vyvolá rebuild UI. So far so good.

Ale load může vyvolat změnu jazyka, a ta by měla vyvolat nahrání správných 
messages. Proto (a případné podobné případy) je ve StateHolderu ten onLoad.
