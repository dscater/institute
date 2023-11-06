<template>
    <div class="content-wrapper contenedor_examen_nivelacions">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Exámen de nivelación > Nuevo</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <router-link
                            :to="{ name: 'examen_nivelacions.index' }"
                            class="btn btn-default btn-flat btn-block"
                        >
                            <i class="fa fa-arrow-left"></i>
                            Volver
                        </router-link>
                    </div>
                </div>
                <div class="row">
                    <Formulario
                        :examen_nivelacion="oExamenNivelacion"
                    ></Formulario>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
import Formulario from "./Formulario.vue";
export default {
    components: {
        Formulario,
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            oExamenNivelacion: {
                id: 0,
                curso_id: "",
                examen_enunciados: [],
            },
        };
    },
    mounted() {
        this.loadingWindow.close();
    },
    methods: {},
};
</script>

<style></style>
