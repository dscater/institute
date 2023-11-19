<template>
    <div class="content-wrapper contenedor_asignacion_grupos">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Administración de Cursos > Asignación de Grupos</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body bg-dark">
                                <router-link
                                    :to="{
                                        name: 'asignacion_grupos.estudiantes',
                                    }"
                                    class="btn btn-success btn-flat btn-block"
                                    >Asignación Estudiantes</router-link
                                >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body bg-dark">
                                <router-link
                                    :to="{
                                        name: 'asignacion_grupos.profesores',
                                    }"
                                    class="btn btn-success btn-flat btn-block"
                                    >Asignación Profesores</router-link
                                >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <hr />
                    </div>
                    <div class="col-md-12">
                        <h4 class="w-100 text-center font-weight-bold">
                            ASIGNACIONES EXISTENTES
                        </h4>
                    </div>
                </div>
                <div class="row" v-if="listGrupos.length > 0">
                    <div class="col-md-4" v-for="item in listGrupos">
                        <div class="card">
                            <div class="card-body text-center pb-2 pt-2">
                                <router-link
                                    class="w-100 text-lg text-success text-center font-weight-bold"
                                    :to="{
                                        name: 'asignacion_grupos.ver_grupo_asignacion',
                                        params: {
                                            id: item.id,
                                        },
                                    }"
                                >
                                    {{ item.nombre }}
                                </router-link>
                                <h4
                                    class="w-100 text-md text-center font-weight-bold"
                                >
                                    {{ item.curso.nombre }}
                                </h4>
                                <router-link
                                    class="btn btn-success text-xs"
                                    :to="{
                                        name: 'asignacion_grupos.ver_grupo_asignacion',
                                        params: { id: item.id },
                                    }"
                                    >Ver grupo</router-link
                                >
                            </div>
                        </div>
                    </div>
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
                <div class="row" v-else>
                    <div class="col-md-12">
                        <h4
                            class="w-100 text-center text-gray font-weight-bold"
                        >
                            NO SE ENCONTRÓ NINGÚN REGISTRO AÚN
                        </h4>
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
            listGrupos: [],
            currentPage: 1,
            rows: 1,
            perPage: 18,
        };
    },
    watch: {
        currentPage(newVal) {
            this.getAsignacionesExistentes(newVal);
        },
    },
    mounted() {
        this.loadingWindow.close();
        this.getAsignacionesExistentes();
    },
    methods: {
        getAsignacionesExistentes(page = 1) {
            axios
                .get(
                    main_url +
                        "/admin/asignacion_grupos/asignaciones_existentes",
                    {
                        params: {
                            page: page,
                        },
                    }
                )
                .then((response) => {
                    this.rows = response.data.grupos.total;
                    this.listGrupos = response.data.grupos.data;
                    this.perPage = response.data.per_page;
                });
        },
    },
};
</script>

<style></style>
