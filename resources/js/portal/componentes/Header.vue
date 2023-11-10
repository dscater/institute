<template>
    <header id="header">
        <div class="header-top">
            <div class="container">
                <div class="row">
                    <div
                        class="col-lg-6 col-sm-6 col-4 header-top-left no-padding"
                    >
                        <a
                            :href="
                                contacto.fono1
                                    ? 'https://wa.me/' +
                                      contacto.fono1.replace(' ', '')
                                    : ''
                            "
                            target="_blank"
                            ><span class="lnr lnr-phone-handset"></span>
                            <span class="text">{{ contacto.fono1 }}</span></a
                        >
                        <a
                            v-if="contacto.fono2 != ''"
                            :href="
                                contacto.fono2
                                    ? 'https://wa.me/' +
                                      contacto.fono2?.replace(' ', '')
                                    : ''
                            "
                            target="_blank"
                            ><span class="lnr lnr-phone-handset"></span>
                            <span class="text">{{ contacto.fono2 }}</span></a
                        >
                        <a :href="'mailto:' + contacto.correo"
                            ><span class="lnr lnr-envelope"></span>
                            <span class="text">{{ contacto.correo }}</span></a
                        >
                    </div>
                    <div
                        class="col-lg-6 col-sm-6 col-8 header-top-right no-padding"
                    >
                        <ul>
                            <li>
                                <a :href="red_social.facebook" target="_blank"
                                    ><i class="fab fa-facebook"></i
                                ></a>
                            </li>
                            <li>
                                <a :href="red_social.tiktok" target="_blank"
                                    ><i class="fab fa-tiktok"></i
                                ></a>
                            </li>
                            <li>
                                <a :href="red_social.instagram" target="_blank"
                                    ><i class="fab fa-instagram"></i
                                ></a>
                            </li>
                            <li>
                                <a :href="red_social.youtube" target="_blank"
                                    ><i class="fab fa-youtube"></i
                                ></a>
                            </li>
                            <li>
                                <a href="/administracion"
                                    ><span class="txt_iniciar_sesion"
                                        >Iniciar sesión</span
                                    >
                                    <i class="fa fa-sign-in-alt"></i
                                ></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="container main-menu">
            <div class="row align-items-center justify-content-between d-flex">
                <div id="logo">
                    <a href=""><img :src="url_logo" alt="" title="" /></a>
                </div>
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li>
                            <router-link exact :to="{ name: 'portal.inicio' }"
                                >Inicio</router-link
                            >
                        </li>
                        <li>
                            <router-link :to="{ name: 'portal.cursos' }"
                                >Cursos</router-link
                            >
                        </li>
                        <li>
                            <router-link :to="{ name: 'portal.inscripciones' }"
                                >Inscripciones</router-link
                            >
                        </li>
                        <li>
                            <router-link :to="{ name: 'portal.horarios' }"
                                >Horarios</router-link
                            >
                        </li>
                        <li>
                            <router-link :to="{ name: 'portal.gestoria' }"
                                >Gestoría de Visa</router-link
                            >
                        </li>
                    </ul>
                </nav>
                <!-- #nav-menu-container -->
            </div>
        </div>
    </header>
    <!-- #header -->
</template>
<script>
export default {
    props: ["contacto", "red_social"],
    data() {
        return {
            fullscreenLoading: false,
            url_logo: main_url + "/imgs/logo.png",
        };
    },
    mounted() {
        this.getLogo();
        let self = this;
        setTimeout(() => {
            self.initMenuTemplate();
        }, 300);
    },
    methods: {
        getLogo() {
            axios.get(main_url + "/getLogo").then((response) => {
                if (response.data) {
                    this.url_logo = response.data;
                } else {
                    this.url_logo = main_url + "/imgs/logo.png";
                }
            });
        },
        initMenuTemplate() {
            //------- Superfist nav menu  js --------//

            $(".nav-menu").superfish({
                animation: {
                    opacity: "show",
                },
                speed: 400,
            });

            /* ---------------------------------------------
            accordion
            --------------------------------------------- */

            var allPanels = $(".accordion > dd").hide();
            allPanels.first().slideDown("easeOutExpo");
            $(".accordion").each(function () {
                $(this)
                    .find("dt > a")
                    .first()
                    .addClass("active")
                    .parent()
                    .next()
                    .css({
                        display: "block",
                    });
            });

            $(document).on("click", ".accordion > dt > a", function (e) {
                var current = $(this).parent().next("dd");
                $(this)
                    .parents(".accordion")
                    .find("dt > a")
                    .removeClass("active");
                $(this).addClass("active");
                $(this).parents(".accordion").find("dd").slideUp("easeInExpo");
                $(this).parent().next().slideDown("easeOutExpo");

                return false;
            });
            //------- Mobile Nav  js --------//

            if ($("#nav-menu-container").length) {
                var $mobile_nav = $("#nav-menu-container").clone().prop({
                    id: "mobile-nav",
                });
                $mobile_nav.find("> ul").attr({
                    class: "",
                    id: "",
                });
                $("body").append($mobile_nav);
                $("body").prepend(
                    '<button type="button" id="mobile-nav-toggle"><i class="lnr lnr-menu"></i></button>'
                );
                $("body").append('<div id="mobile-body-overly"></div>');
                $("#mobile-nav")
                    .find(".menu-has-children")
                    .prepend('<i class="lnr lnr-chevron-down"></i>');

                $(document).on("click", ".menu-has-children i", function (e) {
                    $(this).next().toggleClass("menu-item-active");
                    $(this).nextAll("ul").eq(0).slideToggle();
                    $(this).toggleClass("lnr-chevron-up lnr-chevron-down");
                });

                $(document).on("click", "#mobile-nav-toggle", function (e) {
                    $("body").toggleClass("mobile-nav-active");
                    $("#mobile-nav-toggle i").toggleClass("lnr-cross lnr-menu");
                    $("#mobile-body-overly").toggle();
                });

                $(document).on("click", function (e) {
                    var container = $("#mobile-nav, #mobile-nav-toggle");
                    if (
                        !container.is(e.target) &&
                        container.has(e.target).length === 0
                    ) {
                        if ($("body").hasClass("mobile-nav-active")) {
                            $("body").removeClass("mobile-nav-active");
                            $("#mobile-nav-toggle i").toggleClass(
                                "lnr-cross lnr-menu"
                            );
                            $("#mobile-body-overly").fadeOut();
                        }
                    }
                });
            } else if ($("#mobile-nav, #mobile-nav-toggle").length) {
                $("#mobile-nav, #mobile-nav-toggle").hide();
            }

            //------- Smooth Scroll  js --------//

            $(".nav-menu a, #mobile-nav a, .scrollto").on("click", function () {
                if (
                    location.pathname.replace(/^\//, "") ==
                        this.pathname.replace(/^\//, "") &&
                    location.hostname == this.hostname
                ) {
                    var target = $(this.hash);
                    if (target.length) {
                        var top_space = 0;

                        if ($("#header").length) {
                            top_space = $("#header").outerHeight();

                            if (!$("#header").hasClass("header-fixed")) {
                                top_space = top_space;
                            }
                        }

                        $("html, body").animate(
                            {
                                scrollTop: target.offset().top - top_space,
                            },
                            1500,
                            "easeInOutExpo"
                        );

                        if ($(this).parents(".nav-menu").length) {
                            $(".nav-menu .menu-active").removeClass(
                                "menu-active"
                            );
                            $(this).closest("li").addClass("menu-active");
                        }

                        if ($("body").hasClass("mobile-nav-active")) {
                            $("body").removeClass("mobile-nav-active");
                            $("#mobile-nav-toggle i").toggleClass(
                                "lnr-times lnr-bars"
                            );
                            $("#mobile-body-overly").fadeOut();
                        }
                        return false;
                    }
                }
            });

            $(document).ready(function () {
                $("html, body").hide();

                if (window.location.hash) {
                    setTimeout(function () {
                        $("html, body").scrollTop(0).show();

                        $("html, body").animate(
                            {
                                scrollTop:
                                    $(window.location.hash).offset().top - 108,
                            },
                            1000
                        );
                    }, 0);
                } else {
                    $("html, body").show();
                }
            });

            //------- Header Scroll Class  js --------//

            $(window).scroll(function () {
                if ($(this).scrollTop() > 100) {
                    $("#header").addClass("header-scrolled");
                } else {
                    $("#header").removeClass("header-scrolled");
                }
            });
        },
    },
};
</script>
