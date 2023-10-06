<template>
    <header id="header">
        <div class="header-top">
            <div class="container">
                <div class="row">
                    <div
                        class="col-lg-6 col-sm-6 col-4 header-top-left no-padding"
                    >
                        <a href=""
                            ><span class="lnr lnr-phone-handset"></span>
                            <span class="text">+591 63326803</span></a
                        >
                        <a href=""
                            ><span class="lnr lnr-phone-handset"></span>
                            <span class="text">+591 64312163</span></a
                        >
                        <a href="mailto:info@tomorrowstoday.com"
                            ><span class="lnr lnr-envelope"></span>
                            <span class="text">info@tomorrowstoday.com</span></a
                        >
                    </div>
                    <div
                        class="col-lg-6 col-sm-6 col-8 header-top-right no-padding"
                    >
                        <ul>
                            <li>
                                <a href="#"><i class="fab fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fab fa-dribbble"></i></a>
                            </li>
                            <li>
                                <a href="/administracion"
                                    ><i class="fa fa-sign-in-alt"></i
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
    data() {
        return {
            fullscreenLoading: false,
            url_logo: main_url + "/imgs/logo.png",
        };
    },
    mounted() {
        this.getLogo();
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
    },
};
</script>
