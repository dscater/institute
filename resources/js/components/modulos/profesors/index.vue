<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Profesores</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-md-3">
                                        <button
                                            v-if="
                                                permisos.includes(
                                                    'profesors.create'
                                                )
                                            "
                                            class="btn btn-success btn-flat btn-block"
                                            @click="
                                                abreModal('nuevo');
                                                limpiaProfesor();
                                            "
                                        >
                                            <i class="fa fa-plus"></i>
                                            Nuevo
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <b-col lg="10" class="my-1">
                                        <b-form-group
                                            label="Buscar"
                                            label-for="filter-input"
                                            label-cols-sm="3"
                                            label-align-sm="right"
                                            label-size="sm"
                                            class="mb-0"
                                        >
                                            <b-input-group size="sm">
                                                <b-form-input
                                                    id="filter-input"
                                                    v-model="filter"
                                                    type="search"
                                                    placeholder="Buscar"
                                                ></b-form-input>

                                                <b-input-group-append>
                                                    <b-button
                                                        variant="success"
                                                        :disabled="!filter"
                                                        @click="filter = ''"
                                                        >Borrar</b-button
                                                    >
                                                </b-input-group-append>
                                            </b-input-group>
                                        </b-form-group>
                                    </b-col>
                                    <div class="col-md-12">
                                        <b-overlay
                                            :show="showOverlay"
                                            rounded="sm"
                                        >
                                            <b-table
                                                :fields="fields"
                                                :items="listRegistros"
                                                show-empty
                                                stacked="md"
                                                responsive
                                                :current-page="currentPage"
                                                :per-page="perPage"
                                                @filtered="onFiltered"
                                                empty-text="Sin resultados"
                                                empty-filtered-text="Sin resultados"
                                                :filter="filter"
                                            >
                                                <template #cell(foto)="row">
                                                    <b-avatar
                                                        :src="
                                                            row.item.user
                                                                .path_image
                                                        "
                                                        size="3rem"
                                                    ></b-avatar>
                                                </template>
                                                <template #cell(acceso)="row">
                                                    <span
                                                        class="badge badge-success"
                                                        v-if="
                                                            row.item.user
                                                                .acceso == 1
                                                        "
                                                    >
                                                        HABILITADO
                                                    </span>
                                                    <span
                                                        v-else
                                                        class="badge badge-danger"
                                                    >
                                                        DESHABILITADO
                                                    </span>
                                                </template>

                                                <template #cell(accion)="row">
                                                    <div
                                                        class="row justify-content-between"
                                                    >
                                                        <b-button
                                                            v-if="
                                                                permisos.includes(
                                                                    'profesors.edit'
                                                                )
                                                            "
                                                            size="sm"
                                                            pill
                                                            variant="outline-warning"
                                                            class="btn-flat btn-block"
                                                            title="Editar registro"
                                                            @click="
                                                                editarRegistro(
                                                                    row.item
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-edit"
                                                            ></i>
                                                        </b-button>
                                                        <b-button
                                                            v-if="
                                                                permisos.includes(
                                                                    'profesors.destroy'
                                                                )
                                                            "
                                                            size="sm"
                                                            pill
                                                            variant="outline-danger"
                                                            class="btn-flat btn-block"
                                                            title="Eliminar registro"
                                                            @click="
                                                                eliminaProfesor(
                                                                    row.item.id,
                                                                    row.item
                                                                        .full_name +
                                                                        '<br/><h4>¿Está seguro(a) de eliminar este registro?</h4>'
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-trash"
                                                            ></i>
                                                        </b-button>
                                                    </div>
                                                </template>
                                            </b-table>
                                        </b-overlay>
                                        <div class="row">
                                            <b-col
                                                sm="6"
                                                md="2"
                                                class="ml-auto my-1"
                                            >
                                                <b-form-select
                                                    align="right"
                                                    id="per-page-select"
                                                    v-model="perPage"
                                                    :options="pageOptions"
                                                    size="sm"
                                                ></b-form-select>
                                            </b-col>
                                            <b-col
                                                sm="6"
                                                md="2"
                                                class="my-1 mr-auto"
                                                v-if="perPage"
                                            >
                                                <b-pagination
                                                    v-model="currentPage"
                                                    :total-rows="totalRows"
                                                    :per-page="perPage"
                                                    align="left"
                                                ></b-pagination>
                                            </b-col>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <Nuevo
            :muestra_modal="muestra_modal"
            :accion="modal_accion"
            :profesor="oProfesor"
            @close="muestra_modal = false"
            @envioModal="getProfesors"
        ></Nuevo>
    </div>
</template>

<script>
import Nuevo from "./Nuevo.vue";
export default {
    components: {
        Nuevo,
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            search: "",
            listRegistros: [],
            showOverlay: false,
            fields: [
                { key: "full_name", label: "Nombre", sortable: true },
                { key: "ci", label: "C.I.", sortable: true },
                { key: "nacionalidad", label: "Nacionalidad", sortable: true },
                { key: "pais_residencia", label: "País de residencia" },
                { key: "dir", label: "Dirección" },
                { key: "fono", label: "Teléfono/Celular" },
                { key: "especialidad", label: "Especialidad" },
                { key: "correo", label: "Correo" },
                { key: "foto", label: "Foto" },
                { key: "acceso", label: "Acceso" },
                { key: "mas", label: "Ver mas" },
                { key: "accion", label: "Acción" },
            ],
            loading: true,
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            muestra_modal: false,
            modal_accion: "nuevo",
            oProfesor: {
                id: 0,
                nombres: "",
                apellidos: "",
                ci: "",
                nacionalidad: "",
                pais_residencia: "",
                dir: "",
                fono: "",
                especialidad: "",
                correo: "",
                user_id: "",
                password: "",
                foto: null,
            },
            currentPage: 1,
            perPage: 5,
            pageOptions: [
                { value: 5, text: "Mostrar 5 Registros" },
                { value: 10, text: "Mostrar 10 Registros" },
                { value: 25, text: "Mostrar 25 Registros" },
                { value: 50, text: "Mostrar 50 Registros" },
                { value: 100, text: "Mostrar 100 Registros" },
                { value: this.totalRows, text: "Mostrar Todo" },
            ],
            totalRows: 10,
            filter: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getProfesors();
    },
    methods: {
        // Seleccionar Opciones de Tabla
        editarRegistro(item) {
            this.oProfesor.id = item.id;
            this.oProfesor.nombres = item.nombres ? item.nombres : "";
            this.oProfesor.apellidos = item.apellidos ? item.apellidos : "";
            this.oProfesor.ci = item.ci ? item.ci : "";
            this.oProfesor.nacionalidad = item.nacionalidad ? item.nacionalidad : "";
            this.oProfesor.pais_residencia = item.pais_residencia ? item.pais_residencia : "";
            this.oProfesor.dir = item.dir ? item.dir : "";
            this.oProfesor.fono = item.fono ? item.fono : "";
            this.oProfesor.especialidad = item.especialidad ? item.especialidad : "";
            this.oProfesor.correo = item.correo ? item.correo : "";
            this.oProfesor.user_id = item.user_id ? item.user_id : "";
            this.oProfesor.acceso = item.user.acceso
                ? "" + item.user.acceso
                : "0";
            this.modal_accion = "edit";
            this.muestra_modal = true;
        },

        // Listar Profesors
        getProfesors() {
            this.showOverlay = true;
            this.muestra_modal = false;
            let url = main_url + "/admin/profesors";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios
                .get(url, {
                    params: { per_page: this.per_page },
                })
                .then((res) => {
                    this.showOverlay = false;
                    this.listRegistros = res.data.profesors;
                    this.totalRows = res.data.total;
                });
        },
        eliminaProfesor(id, descripcion) {
            Swal.fire({
                title: "¿Quierés eliminar este registro?",
                html: `<strong>${descripcion}</strong>`,
                showCancelButton: true,
                confirmButtonColor: "#da1900",
                confirmButtonText: "Si, eliminar",
                cancelButtonText: "No, cancelar",
                denyButtonText: `No, cancelar`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    axios
                        .post(main_url + "/admin/profesors/" + id, {
                            _method: "DELETE",
                        })
                        .then((res) => {
                            this.getProfesors();
                            this.filter = "";
                            Swal.fire({
                                icon: "success",
                                title: res.data.msj,
                                showConfirmButton: false,
                                timer: 1500,
                            });
                        })
                        .catch((error) => {
                            if (error.response) {
                                if (error.response.status === 422) {
                                    this.errors = error.response.data.errors;
                                }
                                if (
                                    error.response.status === 420 ||
                                    error.response.status === 419 ||
                                    error.response.status === 401
                                ) {
                                    window.location = "/";
                                }
                                if (error.response.status === 500) {
                                    Swal.fire({
                                        icon: "error",
                                        title: "Error",
                                        html: error.response.data.message,
                                        showConfirmButton: false,
                                        timer: 2000,
                                    });
                                }
                            }
                        });
                }
            });
        },
        abreModal(tipo_accion = "nuevo", profesor = null) {
            this.muestra_modal = true;
            this.modal_accion = tipo_accion;
            if (profesor) {
                this.oProfesor = profesor;
            }
        },
        onFiltered(filteredItems) {
            // Trigger pagination to update the number of buttons/pages due to filtering
            this.totalRows = filteredItems.length;
            this.currentPage = 1;
        },
        limpiaProfesor() {
            this.oProfesor.nombres = "";
            this.oProfesor.apellidos = "";
            this.oProfesor.ci = "";
            this.oProfesor.nacionalidad = "";
            this.oProfesor.pais_residencia = "";
            this.oProfesor.dir = "";
            this.oProfesor.fono = "";
            this.oProfesor.especialidad = "";
            this.oProfesor.correo = "";
            this.oProfesor.user_id = "";
            this.oProfesor.acceso = "0";
            this.oProfesor.foto = null;
        },
        formatoFecha(date) {
            return this.$moment(String(date)).format("DD/MM/YYYY");
        },
    },
};
</script>

<style></style>
