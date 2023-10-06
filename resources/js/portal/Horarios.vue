<template>
    <div class="contenedor_horarios">
        <!-- start banner Area -->
        <section
            class="banner-area relative about-banner"
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
                    <div class="col-md-12">
                        <table class="table table-bordered">
                            <thead class="bg-principal2">
                                <tr>
                                    <th class="text-white text-center">
                                        CURSO
                                    </th>
                                    <th class="text-white text-center">
                                        MODALIDAD
                                    </th>
                                    <th class="text-white text-center">
                                        HORARIO
                                    </th>
                                    <th class="text-white text-center">
                                        FECHA INICIO
                                    </th>
                                    <th class="text-white text-center">
                                        FECHA FIN
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="bg-secundario2">
                                <tr>
                                    <td class="text-white text-center">
                                        Inglés
                                    </td>
                                    <td class="text-white text-center">
                                        Virtual
                                    </td>
                                    <td class="text-white text-center">
                                        18:30 a 20:30
                                    </td>
                                    <td class="text-white text-center">
                                        12/10/2023
                                    </td>
                                    <td class="text-white text-center">
                                        12/10/2023
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-white text-center">
                                        Inglés
                                    </td>
                                    <td class="text-white text-center">
                                        Virtual
                                    </td>
                                    <td class="text-white text-center">
                                        18:30 a 20:30
                                    </td>
                                    <td class="text-white text-center">
                                        12/10/2023
                                    </td>
                                    <td class="text-white text-center">
                                        12/10/2023
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-white text-center">
                                        Inglés
                                    </td>
                                    <td class="text-white text-center">
                                        Virtual
                                    </td>
                                    <td class="text-white text-center">
                                        18:30 a 20:30
                                    </td>
                                    <td class="text-white text-center">
                                        12/10/2023
                                    </td>
                                    <td class="text-white text-center">
                                        12/10/2023
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-white text-center">
                                        Inglés
                                    </td>
                                    <td class="text-white text-center">
                                        Virtual
                                    </td>
                                    <td class="text-white text-center">
                                        18:30 a 20:30
                                    </td>
                                    <td class="text-white text-center">
                                        12/10/2023
                                    </td>
                                    <td class="text-white text-center">
                                        12/10/2023
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-white text-center">
                                        Inglés
                                    </td>
                                    <td class="text-white text-center">
                                        Virtual
                                    </td>
                                    <td class="text-white text-center">
                                        18:30 a 20:30
                                    </td>
                                    <td class="text-white text-center">
                                        12/10/2023
                                    </td>
                                    <td class="text-white text-center">
                                        12/10/2023
                                    </td>
                                </tr>
                            </tbody>
                        </table>
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
        };
    },
    mounted() {
        this.loadingWindow.close();
    },
    methods: {},
};
</script>
<style></style>
