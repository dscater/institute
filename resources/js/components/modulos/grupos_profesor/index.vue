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
                        <div class="contenedor_curso">
                            <div class="imagen_curso">
                                <img
                                    :src="item.grupo.curso?.url_imagen"
                                    alt="Curso"
                                    style="width: 100%"
                                />
                            </div>
                            <div class="detalles_curso">
                                <div class="contenedor_info_curso">
                                    <div class="info_curso">
                                        <h4 class="mb-2 w-100 text-center">
                                            {{ item.grupo.nombre }}
                                        </h4>
                                        <h5 class="text-lg">
                                            {{ item.grupo.curso?.nombre }}
                                        </h5>
                                        <p class="mb-1">
                                            <strong>Estado:</strong>
                                            {{ item.grupo.estado }}
                                        </p>
                                        <p class="mb-1">
                                            <strong>Modalidad:</strong>
                                            {{
                                                item.grupo.horario
                                                    ? item.grupo.horario
                                                          .modalidad
                                                    : "S/A"
                                            }}
                                        </p>
                                        <p class="mb-1">
                                            <strong>Fecha Inicio:</strong>
                                            {{
                                                item.grupo.horario
                                                    ? item.grupo.horario
                                                          .fecha_inicio_t
                                                    : "S/A"
                                            }}
                                        </p>
                                        <p class="mb-1">
                                            <strong>Fecha Fin:</strong>
                                            {{
                                                item.grupo.horario
                                                    ? item.grupo.horario
                                                          .fecha_fin_t
                                                    : "S/A"
                                            }}
                                        </p>
                                        <p class="mb-1">
                                            <strong>Días:</strong>
                                            {{
                                                item.grupo.horario
                                                    ? item.grupo.horario
                                                          .dias_txt
                                                    : "S/A"
                                            }}
                                        </p>
                                        <p class="mb-1">
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
                                        <div class="col-md-12 p-0">
                                            <label>Link de reunión</label>
                                            <input
                                                type="text"
                                                class="form-control"
                                                v-model="
                                                    item.grupo.link_reunion
                                                "
                                            />
                                        </div>
                                        <div class="col-md-12 p-0 mt-1">
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
                                    <div class="info_detalles">
                                        <h4 class="w-100 text-center">
                                            Información del grupo
                                        </h4>
                                        <h6 class="mb-3">
                                            Estudiantes:
                                            {{
                                                item.grupo.asignacion_grupos
                                                    ? item.grupo
                                                          .asignacion_grupos
                                                          .length
                                                    : 0
                                            }}
                                        </h6>
                                        <router-link
                                            :to="{
                                                name: 'asignacion_grupos.ver_grupo_asignacion',
                                                params: {
                                                    id: item.grupo.id,
                                                },
                                            }"
                                            class="font-weight-bold mb-2"
                                            >Ver Estudiantes
                                            <i class="fa fa-arrow-right"></i
                                        ></router-link>
                                        <router-link
                                            :to="{
                                                name: 'examen_nivelacions.examenes_grupo',
                                                params: {
                                                    id: item.grupo.id,
                                                },
                                            }"
                                            class="font-weight-bold mb-2"
                                            >Registrar Calificaciones
                                            <i class="fa fa-arrow-right"></i
                                        ></router-link>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div
                    class="row"
                    v-if="
                        listAsignacionGruposProfesor &&
                        listAsignacionGruposProfesor.length > 0
                    "
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
.contenedor_cursos .contenedor_curso {
    display: flex;
    background-color: white;
}

.contenedor_cursos .imagen_curso {
    display: flex;
    max-width: 800px;
    width: 40%;
}

.contenedor_cursos .imagen_curso img {
    height: 100%;
}

.contenedor_cursos .detalles_curso {
    flex: 1;
}

.contenedor_cursos .contenedor_info_curso {
    display: flex;
    height: 100%;
}
.contenedor_cursos .contenedor_info_curso .info_curso {
    width: 60%;
    border-right: solid 2px #c4c4c4;
    padding: 15px;
}
.contenedor_cursos .contenedor_info_curso .info_detalles {
    flex: 1;
    padding: 15px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

@media (max-width: 800px) {
    .contenedor_cursos .imagen_curso {
        width: 100%;
    }
    .contenedor_cursos .contenedor_info_curso .info_curso {
        width: 100%;
        border-right: none;
        border-bottom: solid 2px #c4c4c4;
    }
    .contenedor_cursos .contenedor_curso {
        flex-direction: column;
    }
    .contenedor_cursos .contenedor_info_curso {
        flex-direction: column;
    }
}
</style>
