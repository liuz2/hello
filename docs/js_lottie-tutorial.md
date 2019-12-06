# Lottie Tutorial

> Lottie is an iOS, Android, and React Native library that renders After Effects animations in real time, allowing apps to use animations as easily as they use static images.

## Get Started

### Install Bodymovin

> Bodymovin is a plugin for After Effects that can export animation in json data format for Lottie to use.

Bodymovin is now [airbnb/lottie-web][2].

### Integrate Lottie

> The same exported json data can be used on all platforms. Get the Lottie library for your native platform of choice.

## Use it on the web

Install with npm:

```sh
$ npm install lottie-web
```

You can call `lottie.loadAnimation()` to start an animation. It returns the animation instance you can control with play, pause, setSpeed, etc.

```js
lottie.loadAnimation({
    name: 'foobar',
    container: element,
    renderer: 'svg', // svg | canvas | html
    loop: true,
    autoplay: true,
    path: 'data.json', // the path to the animation json
});
```

An [online demo][5].

animation instances have these main methods:

```js
anim.play();
anim.stop();
anim.pause();
anim.setLocationHref(locationHref);
anim.setSpeed(speed); // 1 is normal speed
anim.goToAndStop(value, isFrame);
anim.goToAndPlay(value, isFrame);
anim.setDirection(direction);
anim.playSegments(segments, forceFlag);
anim.setSubframe(flag);
anim.destroy();
```

lottie has 8 main methods:

```js
lottie.play(name); // with 1 optional parameter name to target a specific animation
lottie.stop(name); // with 1 optional parameter name to target a specific animation
lottie.setSpeed(speed, name);
lottie.setDirection(speed, name);
lottie.searchAnimations();
lottie.loadAnimation();
lottie.destroy();
lottie.registerAnimation();
lottie.setQuality();
```

Events

```js
onComplete
onLoopComplete
onEnterFrame
onSegmentStart
```

you can also use `addEventListener` with the following events:

```js
complete
loopComplete
enterFrame
segmentStart
config_ready
data_ready
DOMLoaded
destroy
```

## REF

1. [Lottie][1]
1. [Lottie Docs][3]
1. [Web - Lottie Docs][6]
1. [Lottie - Behind the scenes of our new open-source animation tool][4], by *Salih Abdul-Karim*

[1]: https://airbnb.design/lottie/
[2]: https://github.com/airbnb/lottie-web
[3]: http://airbnb.io/lottie "Lottie Docs"
[4]: https://airbnb.design/introducing-lottie/
[5]: https://liuz2.gitee.io/test/lottie-demo/index.html
[6]: http://airbnb.io/lottie/#/web "Web - Lottie Docs"
