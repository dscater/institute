<template>
    <div>
        <Header :contacto="oContacto" :red_social="oRedSocial"></Header>
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

        <Footer :contacto="oContacto" :red_social="oRedSocial"></Footer>

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
        return {
            oContacto: {
                direccion: "",
                fonos: "",
                correo: "",
                mapa: `<iframe src="https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d15302.44340797871!2d-68.13196529479978!3d-16.495230895308648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.497514656468287!2d-68.12797416816427!5e0!3m2!1ses-419!2sbo!4v1697748242821!5m2!1ses-419!2sbo" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>`,
            },
            oRedSocial: {
                tiktok: "",
                facebook: "",
                instagram: "",
                youtube: "",
            },
        };
    },
    mounted() {
        this.getInfoContacto();
        this.getInfoRedSocial();
    },
    methods: {
        getInfoContacto() {
            axios.get(main_url + "/portal/getContacto").then((response) => {
                this.oContacto = response.data.contacto;
            });
        },
        getInfoRedSocial() {
            axios.get(main_url + "/portal/getRedSocial").then((response) => {
                this.oRedSocial = response.data.red_social;
            });
        },
    },
};
</script>

<style></style>
