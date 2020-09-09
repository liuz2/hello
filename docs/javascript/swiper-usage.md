# 使用 Swiper

以 `v3.2.7` 为例。首先，安装依赖：

```sh
$ npm install swiper@3.2.7 --save
```

定义 HTML 结构

```html
<div class="swiper-container">
    <div class="swiper-wrapper">
        <div class="swiper-slide">Slide 1</div>
        <div class="swiper-slide">Slide 2</div>
        <div class="swiper-slide">Slide 3</div>
    </div>
</div>
```

配置 Swiper

```js
import Swiper from 'swiper';
import 'swiper/dist/css/swiper.css';

var mySwiper = new Swiper('.swiper-container', {
    autoplay: 5000,
    direction: 'horizontal',
    /* 居中显示 slide */
    centeredSlides: true,
    /* slides 容器能够同时显示的 slides 数量 */
    slidesPerView: 'auto',
    /* 设置 slide 间隔 */
    spaceBetween: 10,

    onSlideChangeEnd: (swiper) => {
        console.log(swiper.activeIndex);
    }
});

/* 跳转到第三个卡片 */
mySwiper.slideTo(2);

/* DOM 更新后刷新 swiper 实例 */
mySwiper.update();

/* 销毁 swiper 实例 */
mySwiper.destroy();
```

## swiper v6.x

在 Swiper 6.x 中，语法有一些变化。

Install from NPM

```sh
$ npm install swiper
```

```js
import Swiper from 'swiper';
import 'swiper/swiper-bundle.css';

const swiper = new Swiper();
```

By default Swiper exports only core version without additional modules (like Navigation, Pagination, etc.). So you need to import and configure them too:

```js
import Swiper, { Navigation, Pagination, Autoplay } from 'swiper';
Swiper.use([Navigation, Pagination, Autoplay]);
const swiper = new Swiper(...);
```

If you want to import Swiper with all modules (bundle) then it should be imported from `swiper/bundle`:

```js
import Swiper from 'swiper/bundle';

const swiper = new Swiper(...);
```

Finally, we need to initialize Swiper in JS:

```js
const mySwiper = new Swiper({
    direction: 'vertical';
    loop: true,

    pagination: {
        el: '.swiper-pagination',
    },

    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev'
    },

    scrollbar: {
        el: '.swiper-scrollbar'
    },

    autoplay: {
        delay: 5000,
    },
});
```

## 参考文献

1. [Swiper 3 中文网](https://3.swiper.com.cn/api/index.html)
1. [nolimits4web/swiper at 3.2.7](https://github.com/nolimits4web/swiper/tree/v3.2.7)
