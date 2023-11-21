<template>
    <div class="content-wrapper contenedor_cursos">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Cursos > Mis Cursos</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-md-3" v-if="oInscripcion">
                        <router-link
                            :to="{
                                name: 'estudiante_cursos.mis_solicitudes',
                                params: {
                                    id: oInscripcion.id,
                                },
                            }"
                            class="btn btn-success btn-block btn-flat"
                        >
                            <i class="fa fa-list-alt"></i> Mis solicitudes
                        </router-link>
                    </div>
                    <div class="col-md-3" v-if="oInscripcion">
                        <router-link
                            :to="{
                                name: 'estudiante_cursos.nueva_solicitud',
                                params: { id: oInscripcion.id },
                            }"
                            class="btn btn-success btn-block btn-flat"
                        >
                            <i class="fa fa-plus"></i> Nueva solicitud
                        </router-link>
                    </div>
                </div>
                <div class="row">
                    <div
                        class="col-md-12"
                        v-for="item in listAsignacionGruposEstudiante"
                    >
                        <div class="contenedor_curso">
                            <div class="imagen_curso">
                                <img
                                    :src="item.curso.url_imagen"
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
                                        <h5>{{ item.curso.nombre }}</h5>
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
                                        <template
                                            v-if="item.grupo.link_reunion"
                                        >
                                            <a
                                                :href="item.grupo.link_reunion"
                                                target="_blank"
                                                >Enlace Zoom del Curso (Click
                                                Aquí)</a
                                            >
                                        </template>
                                    </div>
                                    <div class="info_detalles">
                                        <h4 class="w-100 text-center">
                                            Calificación del Curso
                                        </h4>
                                        <template v-if="!item.abandono">
                                            <h6
                                                class="w-100 text-center text-gray"
                                            >
                                                {{ item.estado }}
                                            </h6>
                                            <p>
                                                <strong>Calificación: </strong
                                                >{{ item.calificacion }}
                                            </p>
                                        </template>
                                        <template v-else
                                            ><h6 class="text-gray">
                                                ABANDONÓ
                                            </h6></template
                                        >
                                        <template
                                            v-if="
                                                item.inscripcion_solicitud
                                                    .inscripcion_examen
                                            "
                                        >
                                            <h5 class="w-100 text-center">
                                                Examen del curso
                                            </h5>

                                            <p class="w-100 text-center">
                                                Puntaje:
                                                <span
                                                    class="font-weight-bold"
                                                    >{{
                                                        item
                                                            .inscripcion_solicitud
                                                            .inscripcion_examen
                                                            .puntaje
                                                    }}</span
                                                >
                                            </p>
                                        </template>
                                    </div>
                                </div>
                            </div>
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
export default {
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
.contenedor_cursos .contenedor_curso {
    display: flex;
    background-color: white;
}

.contenedor_cursos .imagen_curso {
    display: flex;
    max-width: 800px;
    width: 40%;
}

.contenedor_cursos .imagen_curso .img_curso {
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
