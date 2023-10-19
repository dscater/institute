<template>
    <div class="contenedor_cursos">
        <!-- start banner Area -->
        <section
            class="navegacion banner-area relative about-banner"
            id="home"
            :style="
                'background:url(' + url_principal + '/imgs/banner_seccion.jpg)'
            "
        >
            <div class="overlay overlay-bg"></div>
            <div class="container">
                <div
                    class="row d-flex align-items-center justify-content-center"
                >
                    <div class="about-content col-lg-12">
                        <h1 class="text-white">Ver Curso</h1>
                        <p class="text-white link-nav">
                            <router-link :to="{ name: 'portal.inicio' }"
                                >Inicio
                            </router-link>
                            <span class="lnr lnr-arrow-right"></span>
                            <router-link :to="{ name: 'portal.cursos' }"
                                >Nuestros Cursos
                            </router-link>
                            <span class="lnr lnr-arrow-right"></span>
                            <span>Ver Curso</span>
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <!-- End banner Area -->

        <section class="search-course-area relative section-gap bg-principal">
            <div class="container bg-secundario2">
                <div class="row justify-content-between align-items-center">
                    <div class="col-lg-6 col-md-6 search-course-right p-0">
                        <img
                            :src="url_principal + '/images/p1.jpg'"
                            width="100%"
                        />
                    </div>
                    <div class="col-lg-6 col-md-6 search-course-left text-md">
                        <h1 class="text-white">Inglés Básico</h1>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing
                            elit, sed do eiusmod tempor incididunt ut labore et
                            dolore magna aliqua. Ut enim ad minim veniam, quis
                            nostrud exercitation ullamco laboris nisi ut aliquip
                            ex ea commodo consequat.
                        </p>
                        <hr class="border border-top border-white">
                        <p><span class="font-weight-bold">Profesor: </span>Juan Álvarez Loza</p>
                        <p><span class="font-weight-bold">Horario: </span>18:30 a 20:30</p>
                        <p><span class="font-weight-bold">Días: </span>Lunes, Miércoles y Viernes</p>
                        <p><span class="font-weight-bold">Modalidad: </span>Virtual</p>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>
<script>
export default {
    props: ["id"],
    data() {
        return {
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            url_principal: main_url,
        };
    },
    mounted() {
        this.loadingWindow.close();
    },
    methods: {},
};
</script>
<style>
.contenedor_cursos .contenedor_curso {
    margin-bottom: 15px;
}
.contenedor_cursos .contenedor_curso .thumb {
    overflow: hidden;
}
.contenedor_cursos .contenedor_curso .thumb img {
    width: 100%;
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
    color: #f7631b !important;
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
