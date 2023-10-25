<template>
    <div class="contenedor_cursos">
        <!-- start banner Area -->
        <section
            class="navegacion banner-area relative about-banner"
            id="home"
            :style="
                'background:url(' +
                url_principal +
                '/imgs/ImagenDeNavegaciónPortal.png)'
            "
        >
            <div class="overlay overlay-bg"></div>
            <div class="container">
                <div
                    class="row d-flex align-items-center justify-content-center"
                >
                    <div class="about-content col-lg-12">
                        <h1 class="text-white">Nuestros Cursos</h1>
                        <p class="text-white link-nav">
                            <router-link :to="{ name: 'portal.inicio' }"
                                >Inicio
                            </router-link>
                            <span class="lnr lnr-arrow-right"></span>
                            <span>Nuestros Cursos</span>
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <!-- End banner Area -->

        <!-- Start popular-course Area -->
        <section class="popular-course-area section-gap pt-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 ml-auto mr-auto">
                        <div class="input-group mb-3">
                            <input
                                type="text"
                                class="form-control"
                                placeholder="Buscar..."
                            />
                            <div class="input-group-append">
                                <button class="btn btn-warning">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row courses-page" v-if="listCursos.length > 0">
                    <div
                        class="col-md-3 contenedor_curso"
                        v-for="item in listCursos"
                    >
                        <div class="thumb-wrap relative">
                            <div class="thumb relative">
                                <div class="overlay overlay-bg"></div>
                                <img
                                    class="img-fluid"
                                    :src="item.url_imagen"
                                    alt=""
                                />
                            </div>
                        </div>
                        <div class="details p-3">
                            <router-link
                                :to="{
                                    name: 'portal.curso',
                                    params: { id: 1 },
                                }"
                            >
                                <h4
                                    class="text-principal mt-2 mb-2 titulo_curso"
                                >
                                    {{ item.nombre }}
                                </h4>
                            </router-link>
                            <p class="text-principal">
                                {{ item.texto_corto }}
                            </p>
                            <div class="row mt-2">
                                <div class="col-md-12">
                                    <router-link
                                        :to="{
                                            name: 'portal.curso',
                                            params: { id: 1 },
                                        }"
                                        class="btn btn-warning btn-block btn-flat"
                                    >
                                        Ver más
                                        <span
                                            class="lnr lnr-arrow-right text-white"
                                        ></span>
                                    </router-link>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 text-center">
                        <a href="#" class="primary-btn text-uppercase"
                            >Cargar más cursos</a
                        >
                    </div>
                </div>
                <div class="row" v-else>
                    <div class="col-md-12 p-5 mb-5 mt-5" style="height: 25vh;">
                        <h4
                            class="font-weight-bold text-gray w-100 text-center"
                        >
                            NO SE ENCONTRARÓN REGISTROS
                        </h4>
                    </div>
                </div>
            </div>
        </section>
        <!-- End popular-course Area -->
    </div>
</template>
<script>
export default {
    data() {
        return {
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            url_principal: main_url,
            listCursos: [],
        };
    },
    mounted() {
        this.getCursos();
        this.loadingWindow.close();
    },
    methods: {
        getCursos() {
            axios.get(main_url + "/portal/getCursos").then((response) => {
                this.listCursos = response.data.cursos.data;
            });
        },
    },
};
</script>
<style>
.contenedor_cursos .contenedor_curso {
    margin-bottom: 15px;
}
.contenedor_cursos .contenedor_curso .thumb {
    height: 194px;
    overflow: hidden;
}
.contenedor_cursos .contenedor_curso .thumb img {
    height: 100%;
    -webkit-transition: all 0.3s ease 0s;
    -moz-transition: all 0.3s ease 0s;
    -o-transition: all 0.3s ease 0s;
    transition: all 0.3s ease 0s;
}
.contenedor_cursos .contenedor_curso .meta {
    margin-top: -26px;
    z-index: 2;
    position: inherit;
    padding: 0px 10px;
}
.contenedor_cursos .contenedor_curso .meta p {
    font-size: 12px;
    font-weight: 300;
    color: #fff;
    margin-bottom: 0px;
}
.contenedor_cursos .contenedor_curso .meta p .lnr {
    margin: 0px 5px;
}
.contenedor_cursos .contenedor_curso .meta h4 {
    color: #fff;
}

.contenedor_cursos .contenedor_curso .details {
    background-color: var(--secundario);
}

.contenedor_cursos .contenedor_curso .details h4 {
    -webkit-transition: all 0.3s ease 0s;
    -moz-transition: all 0.3s ease 0s;
    -o-transition: all 0.3s ease 0s;
    transition: all 0.3s ease 0s;
    margin: 20px 0px;
}
.contenedor_cursos .contenedor_curso .details h4:hover {
    color: var(--principal2_hover) !important;
}
@media (max-width: 576px) {
    .contenedor_cursos .contenedor_curso {
        margin: 15px;
    }
}
.contenedor_cursos .contenedor_curso:hover .thumb img {
    transform: scale(1.1);
}
</style>
