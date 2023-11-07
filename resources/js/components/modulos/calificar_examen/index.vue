<template>
    <div class="content-wrapper contenedor_examen_nivelacions">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Examen de nivelación > Calificar</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row mb-3">
                    <div class="col-md-3">
                        <router-link
                            v-if="permisos.includes('examen_nivelacions.index')"
                            :to="{
                                name: 'examen_nivelacions.index',
                            }"
                            class="btn btn-default btn-flat btn-block"
                        >
                            <i class="fa fa-arrow-left"></i>
                            Volver
                        </router-link>
                    </div>
                </div>
                <div class="row">
                    <div
                        class="col-md-4"
                        v-for="item in listInscripcionExamens"
                    >
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4 class="text-md">
                                            {{
                                                item.inscripcion_solicitud.curso
                                                    .nombre
                                            }}
                                        </h4>
                                    </div>
                                    <div class="col-md-12">
                                        <p class="mb-1">
                                            <strong>Estudiante: </strong>
                                            {{ item.inscripcion.full_name }}
                                        </p>
                                        <p class="mb-1">
                                            <strong>Código Examen: </strong>
                                            {{ item.examen_nivelacion.id }}
                                        </p>
                                        <p class="mb-1">
                                            <strong>Puntaje: </strong>
                                            {{ item.puntaje }}
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="row">
                                    <div class="col-md-3">
                                        <router-link
                                            :to="{
                                                name: 'examen_nivelacions.calificar_examen',
                                                params: {
                                                    id: item.id,
                                                },
                                            }"
                                            class="btn btn-success btn-flat btn-block"
                                        >
                                            <i
                                                class="fa fa-clipboard-check"
                                            ></i>
                                            Calificar
                                        </router-link>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" v-if="listInscripcionExamens.length > 0">
                    <div class="col-md-12 pb-3 paginacion_portal">
                        <b-pagination
                            class="rounded-0"
                            align="center"
                            v-model="currentPage"
                            :total-rows="rows"
                            :per-page="perPage"
                            aria-controls="my-table"
                        ></b-pagination>
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
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            listInscripcionExamens: [],
            listGrupos: [],
            search: "",
            currentPage: 1,
            perPage: 10,
            rows: 10,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getInscripcionExamens();
    },
    methods: {
        getInscripcionExamens(page = 1) {
            axios
                .get(main_url + "/admin/inscripcion_examens", {
                    params: { page: page, per_page: this.per_page },
                })
                .then((response) => {
                    this.rows = response.data.inscripcion_examens.total;
                    this.perPage = response.data.per_page;
                    this.listInscripcionExamens =
                        response.data.inscripcion_examens.data;
                });
        },
    },
};
</script>

<style>
.contenedor_examen_nivelacions .img_examen_nivelacion {
    height: 100px;
}
</style>
