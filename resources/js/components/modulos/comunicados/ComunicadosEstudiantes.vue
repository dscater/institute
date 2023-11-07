<template>
    <div class="content-wrapper contenedor_cursos">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Comunicados</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div
                        class="col-md-12"
                        v-for="item in listAsignacionGruposEstudiante"
                    >
                        <div class="row">
                            <div class="col-md-12 pl-3">
                                <h4 class="text-md">{{ item.curso.nombre }}</h4>
                            </div>
                            <GrupoComunicados
                                :grupo_id="item.grupo_id"
                            ></GrupoComunicados>
                        </div>
                    </div>
                </div>
                <div
                    class="row"
                    v-if="listAsignacionGruposEstudiante.length > 0"
                >
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
import GrupoComunicados from "./GrupoComunicados";
export default {
    components: {
        GrupoComunicados,
    },
    watch: {
        currentPage(newVal) {
            this.getAsignacionesGruposEstudiante(newVal);
        },
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            search: "",
            currentPage: 1,
            perPage: 10,
            rows: 10,
            listAsignacionGruposEstudiante: [],
            oInscripcion: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getAsignacionesGruposEstudiante();
    },
    methods: {
        // Listar Cursos
        getAsignacionesGruposEstudiante(page = 1) {
            this.showOverlay = true;
            let url =
                main_url + "/admin/asignacion_grupos/asignaciones_estudiante";
            axios
                .get(url, {
                    params: { page: page, per_page: this.per_page },
                })
                .then((response) => {
                    this.rows = response.data.asignacion_grupos.total;
                    this.perPage = response.data.per_page;

                    this.listAsignacionGruposEstudiante =
                        response.data.asignacion_grupos.data;
                    this.oInscripcion = response.data.inscripcion;
                });
        },
    },
};
</script>

<style>
.contenedor_cursos .img_curso {
    height: 100px;
}
</style>
