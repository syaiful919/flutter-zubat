# zubat
Playground project

## Run project

Before run the project, prepare 2 keystores for debug and production, place them in the following directory.
```
android/
└── keys/
    ├── debug-key.jks
    └── production-key.jks
```

then create ``.properties`` files for both of them.
```
storePassword=<PASSWORD>
keyPassword=<PASSWORD>
keyAlias=<KEY_ALIAS>
storeFile=keys/<KEY>.jks 
```

place them in the following directory.
```
android/
├── key.properties
└── key-debug.properties  
```

You're all set 