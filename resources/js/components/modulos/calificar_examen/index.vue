<template>
    <div class="content-wrapper contenedor_examen_nivelacions">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Examen de nivelación</h1>
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
                        v-for="item in listAsignacionGruposProfesor"
                    >
                        <div class="card">
                            <div class="card-body pb-2 pt-2">
                                <div class="row">
                                    <div class="col-md-12 text-center">
                                        <router-link
                                            :to="{
                                                name: 'examen_nivelacions.examenes_grupo',
                                                params: { id: item.grupo.id },
                                            }"
                                            class="w-100 text-lg text-success text-center font-weight-bold"
                                        >
                                            {{ item.grupo.nombre }}
                                        </router-link>
                                        <h4
                                            class="w-100 text-md text-center font-weight-bold"
                                        >
                                            {{ item.grupo.curso.nombre }}
                                        </h4>
                                        <router-link
                                            class="btn btn-success text-xs"
                                            :to="{
                                                name: 'examen_nivelacions.examenes_grupo',
                                                params: { id: item.grupo.id },
                                            }"
                                            >Ver grupo</router-link
                                        >
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" v-if="listAsignacionGruposProfesor.length > 0">
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
            listAsignacionGruposProfesor: [],
            search: "",
            currentPage: 1,
            perPage: 10,
            rows: 10,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getAsignacionesGruposProfesor();
    },
    methods: {
        getAsignacionesGruposProfesor(page = 1) {
            this.showOverlay = true;
            let url = main_url + "/admin/grupo_profesors/asignaciones_profesor";
            axios
                .get(url, {
                    params: { page: page, per_page: this.per_page },
                })
                .then((response) => {
                    this.rows = response.data.grupo_profesors.total;
                    this.perPage = response.data.per_page;

                    this.listAsignacionGruposProfesor =
                        response.data.grupo_profesors.data;
                    this.oInscripcion = response.data.inscripcion;
                });
        },
    },
};
</script>

<style></style>
