<template>
    <div>
        <Header></Header>
        <Slider
            :ruta_asset="ruta_asset"
            v-if="$route.name == 'portal.inicio'"
        ></Slider>
        <SliderGestoria
            :ruta_asset="ruta_asset"
            v-if="$route.name == 'portal.gestoria'"
        ></SliderGestoria>

        <transition name="fade" mode="out-in">
            <router-view></router-view>
        </transition>

        <Footer></Footer>

        <!-- Back to top -->
        <div class="btn-back-to-top" id="myBtn">
            <span class="symbol-btn-back-to-top">
                <i class="fa fa-angle-up"></i>
            </span>
        </div>
    </div>
</template>

<script>
import Header from "./componentes/Header.vue";
import Slider from "./componentes/Slider.vue";
import SliderGestoria from "./componentes/SliderGestoria.vue";
import Footer from "./componentes/Footer.vue";

export default {
    components: {
        Header,
        Slider,
        SliderGestoria,
        Footer,
    },
    props: {
        logo: {
            String,
            default:
                "https://www.logodesign.net/logo/eye-and-house-5806ld.png?size=2&industry=All",
        },
        ruta: {
            String,
            default: "",
        },
        ruta_asset: {
            String,
            default: "",
        },
        configuracion: {
            Object,
            default: {
                nombre_sistema: "",
                alias: "",
                razon_social: "",
                nit: "",
                ciudad: "",
                dir: "",
                fono: "",
                web: "",
                actividad: "",
                correo: "",
                logo: "",
            },
        },
    },
    data() {
        return {};
    },
    mounted() {},
    methods: {},
};
</script>

<style></style>
