# localStorage is null in Android webview

The following was missing:

```java
settings.setDomStorageEnabled(true);
```

## REF

1. [Android webview & localStorage](https://stackoverflow.com/questions/5899087/android-webview-localstorage/5934650#5934650), by *Thomas*, stackoverflow.com
