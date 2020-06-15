# 使用 Swiper

以 `v3.2.7` 为例。

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

## 参考文献

1. [Swiper 3 中文网](https://3.swiper.com.cn/api/index.html)
1. [nolimits4web/swiper at 3.2.7](https://github.com/nolimits4web/swiper/tree/v3.2.7)