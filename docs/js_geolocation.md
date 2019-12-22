# 获取当前地理位置

该特性仅在 HTTPS 中可用。

`navigator.geolocation` 返回一个 `Geolocation` 对象实例，通过它可以获取设备的地理位置。

Geolocation 接口包含三个对象：

1. `getCurrentPosition` 获取当前设备的位置，返回一个 `GeolocationPosition` 对象
1. `watchPosition` 返回一个 `long` 数值，代表新创建的回调函数，在地理位置变化时调用
1. `clearWatch` 清除 `watchPosition` 设定的监听函数

`GeolocationPosition` 对象包含两个属性：

1. `coords` 返回地理位置，类型为 `GeolocationCoordinates`
1. `timestamp` 返回地理位置对应的时间戳，类型为 `DOMTimeStamp`

## 示例

下面展示了如何获取用户位置经纬度：

```js
navigator.geolocation.getCurrentPosition(success, error);

function success(position) {
    const { latitude, longitude } = position.coords;
    const link = `https://www.openstreetmap.org/#map=18/${latitude}/${longitude}`;
}
```

## REF

1. [Navigator.geolocation][1] - MDN
1. [Geolocation][2]
1. [Geolocation API][4]

[1]: https://developer.mozilla.org/en-US/docs/Web/API/Navigator/geolocation "Navigator.·geolocation"
[2]: https://developer.mozilla.org/en-US/docs/Web/API/Geolocation "Geolocation"
[3]: https://developer.mozilla.org/en-US/docs/Web/API/GeolocationPosition "GeolocationPosition"
[4]: https://developer.mozilla.org/en-US/docs/Web/API/Geolocation_API "Geolocation API"
