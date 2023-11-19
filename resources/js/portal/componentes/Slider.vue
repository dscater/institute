<template>
    <!-- start banner Area -->
    <section class="relative">
        <div class="wrap-slick1 rs1-slick1">
            <div class="slick1">
                <div
                    v-for="item in listSliders"
                    class="item-slick1 banner-area overlay-bg"
                    :style="'background-image: url(' + item.url_img + ')'"
                >
                    <!-- <div class="overlay overlay-bg"></div> -->

                    <div class="container-fluid h-full info_slider">
                        <div class="flex-col-l-m h-full p-t-100 p-b-30">
                            <div
                                class="layer-slick1 animated visible-false"
                                data-appear="rollIn"
                                data-delay="0"
                                v-if="item.titulo && item.titulo.trim() != ''"
                            >
                                <span class="ltext-202 respon2">{{
                                    item.titulo
                                }}</span>
                            </div>

                            <div
                                class="layer-slick1 animated visible-false"
                                data-appear="lightSpeedIn"
                                data-delay="800"
                                v-if="
                                    item.descripcion &&
                                    item.descripcion.trim() != ''
                                "
                            >
                                <h2 class="ltext-104 p-t-19 p-b-43 respon1">
                                    {{ item.descripcion }}
                                </h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Start feature Area -->
        <section class="feature-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="single-feature">
                            <!-- <div class="title">
                                <h4>Learn Online Courses</h4>
                            </div> -->
                            <div class="desc-wrap">
                                <p v-html="oPortalComunicado.descripcion"></p>
                                <!-- <a href="#">Join Now</a> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End feature Area -->
    </section>
    <!-- End banner Area -->
</template>
<script>
export default {
    props: ["ruta_asset"],
    data() {
        return {
            listSliders: [
                // {
                //     id: 0,
                //     img: "",
                //     url_img: this.ruta_asset + "imgs/banners/1.jpg",
                //     posicion: 0,
                //     desc1: "TÍTULO 1",
                //     desc2: "Portal institute",
                //     muestra_boton: 0,
                // },
                // {
                //     id: 0,
                //     img: "",
                //     url_img: this.ruta_asset + "imgs/banners/2.jpg",
                //     posicion: 0,
                //     desc1: "TÍTULO 1",
                //     desc2: "Portal institute",
                //     muestra_boton: 0,
                // },
                // {
                //     id: 0,
                //     img: "",
                //     url_img: this.ruta_asset + "imgs/banners/3.jpg",
                //     posicion: 0,
                //     desc1: "TÍTULO 1",
                //     desc2: "Portal institute",
                //     muestra_boton: 0,
                // },
            ],
            url_principal: main_url,
            oPortalComunicado: {
                descripcion: `
                            Programa de inglés intensivo<br />
                            Aprende el idioma inglés de forma
                            estructurada y efectiva.<br />
                            En BEI, trabajamos contigo para desarrollar
                            tus habilidades y mejorar tu dominio del
                            idioma inglés para que puedas tener más
                            éxito en la vida.<br />
                            ¡Estudiante F-1 bienvenidos!`,
            },
            texto_portal_inicio: `<div class="flex-col-l-m h-full p-t-100 p-b-30">
                                        <div class="layer-slick1 animated visible-false" data-appear="rollIn" data-delay="0">
                                            <span class="ltext-202 respon2">${texto_slider_inicio1}</span>
                                        </div>

                                        <div class="layer-slick1 animated visible-false" data-appear="lightSpeedIn" data-delay="800">
                                            <h2 class="ltext-104 p-t-19 p-b-43 respon1">
                                                ${texto_slider_inicio2}
                                            </h2>
                                        </div>
                                    </div>`,
        };
    },
    mounted() {
        this.getSliders();
        this.getPortalComunciado();
    },
    methods: {
        getSliders() {
            axios.get(main_url + "/portal/getSliders").then((response) => {
                if (response.data.total > 0) {
                    this.listSliders = response.data.banners;
                }
                let self = this;
                setTimeout(function () {
                    self.initSlick1();
                    $(".slick1").slick("slickGoTo", 0);
                }, 300);
            });
        },
        getPortalComunciado() {
            axios
                .get(main_url + "/portal/getPortalComunciado")
                .then((response) => {
                    this.oPortalComunicado = response.data.portal_comunicado;
                });
        },
        initSlick1() {
            $(".wrap-slick1").each(function () {
                var wrapSlick1 = $(this);
                var slick1 = $(this).find(".slick1");

                var itemSlick1 = $(slick1).find(".item-slick1");
                var layerSlick1 = $(slick1).find(".layer-slick1");
                var actionSlick1 = [];

                $(slick1).on("init", function () {
                    var layerCurrentItem = $(itemSlick1[0]).find(
                        ".layer-slick1"
                    );

                    for (var i = 0; i < actionSlick1.length; i++) {
                        clearTimeout(actionSlick1[i]);
                    }

                    $(layerSlick1).each(function () {
                        $(this).removeClass(
                            $(this).data("appear") + " visible-true"
                        );
                    });

                    for (var i = 0; i < layerCurrentItem.length; i++) {
                        actionSlick1[i] = setTimeout(
                            function (index) {
                                $(layerCurrentItem[index]).addClass(
                                    $(layerCurrentItem[index]).data("appear") +
                                        " visible-true"
                                );
                            },
                            $(layerCurrentItem[i]).data("delay"),
                            i
                        );
                    }
                });

                var showDot = false;
                if ($(wrapSlick1).find(".wrap-slick1-dots").length > 0) {
                    showDot = true;
                }

                $(slick1).slick({
                    pauseOnFocus: false,
                    pauseOnHover: false,
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    fade: true,
                    speed: 1000,
                    infinite: true,
                    autoplay: true,
                    autoplaySpeed: 6000,
                    arrows: true,
                    appendArrows: $(wrapSlick1),
                    prevArrow:
                        '<button class="arrow-slick1 prev-slick1"><i class="fa fa-angle-left"></i></button>',
                    nextArrow:
                        '<button class="arrow-slick1 next-slick1"><i class="fa fa-angle-right"></i></button>',
                    dots: showDot,
                    appendDots: $(wrapSlick1).find(".wrap-slick1-dots"),
                    dotsClass: "slick1-dots",
                    customPaging: function (slick, index) {
                        var linkThumb = $(slick.$slides[index]).data("thumb");
                        var caption = $(slick.$slides[index]).data("caption");
                        return (
                            '<img src="' +
                            linkThumb +
                            '">' +
                            '<span class="caption-dots-slick1">' +
                            caption +
                            "</span>"
                        );
                    },
                });

                $(slick1).on(
                    "afterChange",
                    function (event, slick, currentSlide) {
                        var layerCurrentItem = $(itemSlick1[currentSlide]).find(
                            ".layer-slick1"
                        );

                        for (var i = 0; i < actionSlick1.length; i++) {
                            clearTimeout(actionSlick1[i]);
                        }

                        $(layerSlick1).each(function () {
                            $(this).removeClass(
                                $(this).data("appear") + " visible-true"
                            );
                        });

                        for (var i = 0; i < layerCurrentItem.length; i++) {
                            actionSlick1[i] = setTimeout(
                                function (index) {
                                    $(layerCurrentItem[index]).addClass(
                                        $(layerCurrentItem[index]).data(
                                            "appear"
                                        ) + " visible-true"
                                    );
                                },
                                $(layerCurrentItem[i]).data("delay"),
                                i
                            );
                        }
                    }
                );
            });
        },
    },
};
</script>
