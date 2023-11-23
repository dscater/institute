<template>
    <div class="contenedor_horarios">
        <!-- start banner Area -->
        <section
            class="navegacion banner-area relative about-banner"
            id="home"
            :style="
                'background:url(' +
                url_principal +
                '/imgs/imagennavegacion.png)'
            "
        >
            <div class="overlay overlay-bg"></div>
            <div class="container">
                <div
                    class="row d-flex align-items-center justify-content-center"
                >
                    <div class="about-content col-lg-12">
                        <h1 class="text-white">Horarios</h1>
                        <p class="text-white link-nav">
                            <router-link :to="{ name: 'portal.inicio' }"
                                >Inicio
                            </router-link>
                            <span class="lnr lnr-arrow-right"></span>
                            <span>Horarios</span>
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <!-- End banner Area -->

        <!-- Start popular-course Area -->
        <section class="popular-course-area section-gap pt-3">
            <div class="container">
                <div class="row pt-5">
                    <!-- <div class="col-md-6 ml-auto mr-auto">
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
                    </div> -->
                    <div class="col-md-12" v-html="html_horarios"></div>
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
            listHorarios: [],
            html_horarios: "",
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getHorarios();
    },
    methods: {
        getHorarios() {
            axios.get(main_url + "/portal/horarios").then((response) => {
                this.listHorarios = response.data.horarios;
                this.html_horarios = response.data.html;
            });
        },
    },
};
</script>
<style></style>
