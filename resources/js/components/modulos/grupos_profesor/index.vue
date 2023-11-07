<template>
    <div class="content-wrapper contenedor_cursos">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Administración de Cursos > Mis Grupos</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div
                        class="col-md-12"
                        v-for="(item, index) in listAsignacionGruposProfesor"
                    >
                        <div class="card">
                            <div class="card-body p-0">
                                <div class="row">
                                    <div class="col-md-4 p-0">
                                        <img
                                            :src="item.grupo.curso?.url_imagen"
                                            alt="Curso"
                                            style="width: 100%"
                                        />
                                    </div>
                                    <div class="col-md-8 p-4">
                                        <h4>{{ item.grupo.curso?.nombre }}</h4>
                                        <p>
                                            <strong>Estado:</strong>
                                            {{ item.grupo.estado }}
                                        </p>
                                        <p>
                                            <strong>Modalidad:</strong>
                                            {{
                                                item.grupo.horario
                                                    ? item.grupo.horario
                                                          .modalidad
                                                    : "S/A"
                                            }}
                                        </p>
                                        <p>
                                            <strong>Fecha Inicio:</strong>
                                            {{
                                                item.grupo.horario
                                                    ? item.grupo.horario
                                                          .fecha_inicio_t
                                                    : "S/A"
                                            }}
                                        </p>
                                        <p>
                                            <strong>Fecha Fin:</strong>
                                            {{
                                                item.grupo.horario
                                                    ? item.grupo.horario
                                                          .fecha_fin_t
                                                    : "S/A"
                                            }}
                                        </p>
                                        <p>
                                            <strong>Días:</strong>
                                            {{
                                                item.grupo.horario
                                                    ? item.grupo.horario
                                                          .dias_txt
                                                    : "S/A"
                                            }}
                                        </p>
                                        <p>
                                            <strong>Horario:</strong>
                                            {{
                                                item.grupo.horario
                                                    ? item.grupo.horario
                                                          .hora_inicio_t
                                                    : "S/A"
                                            }}
                                            a
                                            {{
                                                item.grupo.horario
                                                    ? item.grupo.horario
                                                          .hora_fin_t
                                                    : "S/A"
                                            }}
                                        </p>
                                        <div class="row">
                                            <div class="col-md-12 form-group">
                                                <label>Link de reunión</label>
                                                <input
                                                    type="text"
                                                    class="form-control"
                                                    v-model="
                                                        item.grupo.link_reunion
                                                    "
                                                />
                                            </div>
                                            <div class="col-md-3">
                                                <button
                                                    class="btn btn-success btn-fllat btn-block"
                                                    @click="
                                                        actualizarLinkReunion(
                                                            item.grupo.id,
                                                            index
                                                        )
                                                    "
                                                >
                                                    <i class="fa fa-sync"></i>
                                                    Actualizar link
                                                </button>
                                            </div>
                                        </div>
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
    watch: {
        currentPage(newVal) {
            this.getAsignacionesGruposProfesor(newVal);
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
            listAsignacionGruposProfesor: [],
            oInscripcion: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getAsignacionesGruposProfesor();
    },
    methods: {
        // Listar Cursos
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
        actualizarLinkReunion(id, index) {
            let grupo = this.listAsignacionGruposProfesor[index].grupo;
            axios
                .post(main_url + "/admin/grupos/actualiza_link/" + id, {
                    _method: "put",
                    link_reunion: grupo.link_reunion,
                })
                .then((response) => {
                    Swal.fire({
                        icon: "success",
                        title: response.data.msj,
                        showConfirmButton: false,
                        timer: 1500,
                    });
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
