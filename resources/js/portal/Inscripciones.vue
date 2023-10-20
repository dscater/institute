<template>
    <div class="contenedor_inscripciones">
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
                        <h1 class="text-white">Inscripciones</h1>
                        <p class="text-white link-nav">
                            <router-link :to="{ name: 'portal.inicio' }"
                                >Inicio
                            </router-link>
                            <span class="lnr lnr-arrow-right"></span>
                            <span>Inscripciones</span>
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <!-- End banner Area -->

        <section class="popular-course-area section-gap pt-3">
            <div class="container">
                <div class="row">
                    <div class="col-4 p-0 contenedor_paso activo">
                        <button class="btn btn-flat bg-secundario">
                            <span class="numero_paso">1</span>
                            <span class="texto_paso">Inscripción</span>
                        </button>
                    </div>
                    <div class="col-4 p-0 contenedor_paso">
                        <button class="btn btn-flat btn-block bg-secundario">
                            <span class="numero_paso">2</span>
                            <span class="texto_paso">Pago</span>
                        </button>
                    </div>
                    <div class="col-4 p-0 contenedor_paso">
                        <button class="btn btn-flat btn-block bg-secundario">
                            <span class="numero_paso">3</span>
                            <span class="texto_paso">Finazliar</span>
                        </button>
                    </div>
                    <div class="col-md-12 p-0 contenedor_forms">
                        <div class="card bg-secundario2">
                            <div class="card-header bg-principal2">
                                <h4 class="title">Inscripción</h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label>Nombres:</label>
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Apellidos:</label>
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            >Nro. Identificación
                                            (CI/DNI):</label
                                        >
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Teléfono/Celular:</label>
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Fecha de Nacimiento:</label>
                                        <input
                                            type="date"
                                            class="form-control w-full"
                                        />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>País:</label>
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Dirección:</label>
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Email:</label>
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Curso:</label>
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Horario:</label>
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="row">
                                    <div class="col-md-6">
                                        <button
                                            class="btn btn-success btn-block btn-flat"
                                        >
                                            <span
                                                class="lnr lnr-arrow-left text-white"
                                            ></span>
                                            Anterior
                                        </button>
                                    </div>
                                    <div class="col-md-6">
                                        <button
                                            class="btn btn-success btn-block btn-flat"
                                        >
                                            Siguiente
                                            <span
                                                class="lnr lnr-arrow-right text-white"
                                            ></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
<style>
.contenedor_inscripciones .contenedor_paso {
    text-align: center;
}
.contenedor_inscripciones .contenedor_paso button {
    text-align: center;
    background-color: transparent;
    color: white;
    height: auto;
    margin-bottom: 15px;
}

.contenedor_inscripciones .contenedor_paso.activo .numero_paso {
    background-color: var(--principal2);
}

.contenedor_inscripciones .contenedor_paso .numero_paso {
    border-radius: 50%;
    border: solid 1px;
    padding: 15px 19px;
}

.contenedor_inscripciones .contenedor_forms .card,
.contenedor_inscripciones .contenedor_forms .card .card-body {
    border-radius: 0px;
}
@media (max-width: 800px) {
    .contenedor_inscripciones .contenedor_paso .texto_paso {
        display: none;
    }
}
</style>
