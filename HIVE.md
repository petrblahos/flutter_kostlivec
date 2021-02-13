# flutter_kostlivec s https://docs.hivedb.dev/#/

## built_value
Problém je, že se mi nepodařilo donutit hivedb fungovat s built_value
ani built_collections. Tím pádem jsem si tu immutability musel zařídit
sám klasicky - state object vrací ImmutableList, a je tam hodně kopírování.

No a tím pádem nemáme builder, takže ten MyDummyAppState má druhej konstruktor
build, což je dost blbé, ale na vyzkoušení to stačí.

StateHolder teď dělá _hiveBox.put(0, _state), což není ideální.
Lepší by bylo, když už je v HiveBoxu jeden objekt, tak ukládat jeho
properties, jako třeba u ConfigState by se ukládal jako

    _hiveBox.put("_mode", _state._mode)
    _hiveBox.put("_language", _state._language)

ale to by musel vzniknout nějakej chytřejší adapter/serializer. 

## HiveType / Adapter
Pro cokoliv jiného než primitivní typy a List, Map je potřeba udělat a zaregistrovat
adaptér. Pak ten adaptér zaregistrovat:

    // launcher.dart
    Hive.registerAdapter(MyDummyAppStateAdapter());
    Hive.registerAdapter(ConfigStateAdapter());
    Hive.registerAdapter(BuildFlavorAdapter());

## PersistenceService
Ten už vlastně nebude potřeba, protože se všechno cpe hned do HiveBoxů. 
Jenže v původním kostlivcovi se v launcheru vytvoří initial state, pak
se nahraje persisten state, a pak se sestaví UI s providerama.

## Language/locale
Teď sestavím initial state, kterej ale sám od sebe vyvolá async načtení 
dat z HiveBoxů. Pak se sestaví UI, jenže když se dokončí sestavení UI
předtím, než se nahrají data z disku, tak se nám nepřepne locale.
Tak jsem na ConfigState dal listener configUpdated, kterej způsobí 
reload messages. (to není ideální, kdyby se měnilo v configu ještě něco,
tak bychom pokaždé reloadovali messages)
