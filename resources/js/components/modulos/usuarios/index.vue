<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Personal</h1>
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
                                                    'usuarios.create'
                                                )
                                            "
                                            class="btn btn-warning btn-flat btn-block"
                                            @click="
                                                abreModal('nuevo');
                                                limpiaUsuario();
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
                                                        variant="warning"
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
                                                            row.item.path_image
                                                        "
                                                        size="3rem"
                                                    ></b-avatar>
                                                </template>
                                                <template #cell(estado)="row">
                                                    <span
                                                        class="badge badge-success"
                                                        v-if="
                                                            row.item.estado == 1
                                                        "
                                                    >
                                                        HABILITADO
                                                    </span>
                                                    <span
                                                        v-else
                                                        class="badge badge-danger"
                                                    >
                                                        RETIRADO
                                                    </span>
                                                </template>
                                                <template #cell(mas)="row">
                                                    <b-button
                                                        variant="warning"
                                                        size="sm"
                                                        @click="
                                                            row.toggleDetails
                                                        "
                                                    >
                                                        {{
                                                            row.detailsShowing
                                                                ? "Ocultar"
                                                                : "Mostrar"
                                                        }}
                                                        Detalles
                                                    </b-button>
                                                </template>

                                                <template #row-details="row">
                                                    <b-card>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Fecha de
                                                                    nacimiento:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item
                                                                    .fecha_nac
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Genero:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item.genero
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Cargo:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item.cargo
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Fecha de
                                                                    ingreso:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item
                                                                    .fecha_ingreso
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Taller al
                                                                    que
                                                                    pertenece:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item.taller
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Dirección:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item.dir
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Teléfono/Celular:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item.fono
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Tipo de
                                                                    personal:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item
                                                                    .tipo_personal
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Porcentaje
                                                                    de
                                                                    discapacidad(%):</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item
                                                                    .p_discapacidad
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Validez del
                                                                    credencial:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item
                                                                    .validez_credencial
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-button
                                                            size="sm"
                                                            variant="warning"
                                                            @click="
                                                                row.toggleDetails
                                                            "
                                                            >Ocultar</b-button
                                                        >
                                                    </b-card>
                                                </template>

                                                <template #cell(accion)="row">
                                                    <div
                                                        class="row justify-content-between"
                                                    >
                                                        <b-button
                                                            size="sm"
                                                            pill
                                                            variant="outline-primary"
                                                            class="btn-flat btn-block"
                                                            title="Exportar credencial"
                                                            @click="
                                                                imprimirCredencial(
                                                                    row.item.id
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-id-card"
                                                            ></i>
                                                        </b-button>
                                                        <b-button
                                                            v-if="
                                                                permisos.includes(
                                                                    'usuarios.edit'
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
                                                                    'usuarios.destroy'
                                                                )
                                                            "
                                                            size="sm"
                                                            pill
                                                            variant="outline-danger"
                                                            class="btn-flat btn-block"
                                                            title="Eliminar registro"
                                                            @click="
                                                                eliminaUsuario(
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
            :usuario="oUsuario"
            @close="muestra_modal = false"
            @envioModal="getUsuarios"
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
                {
                    key: "usuario",
                    label: "Usuario",
                    sortable: true,
                },
                { key: "full_name", label: "Nombre", sortable: true },
                { key: "full_ci", label: "C.I.", sortable: true },
                { key: "tipo", label: "Tipo Usuario", sortable: true },
                { key: "foto", label: "Foto" },
                { key: "estado", label: "Estado" },
                {
                    key: "fecha_registro_t",
                    label: "Fecha de registro",
                    sortable: true,
                },
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
            oUsuario: {
                id: 0,
                nombre: "",
                paterno: "",
                materno: "",
                ci: "",
                ci_exp: "",
                fecha_nac: "",
                genero: "",
                cargo: "",
                fecha_ingreso: "",
                taller: "",
                dir: "",
                fono: [],
                tipo_personal: "",
                p_discapacidad: "",
                tipo: "",
                foto: null,
                validez_credencial: "",
                password: "",
                estado: "",
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
        this.getUsuarios();
    },
    methods: {
        // Seleccionar Opciones de Tabla
        editarRegistro(item) {
            this.oUsuario.id = item.id;
            this.oUsuario.nombre = item.nombre ? item.nombre : "";
            this.oUsuario.paterno = item.paterno ? item.paterno : "";
            this.oUsuario.materno = item.materno ? item.materno : "";
            this.oUsuario.ci = item.ci ? item.ci : "";
            this.oUsuario.ci_exp = item.ci_exp ? item.ci_exp : "";
            this.oUsuario.fecha_nac = item.fecha_nac ? item.fecha_nac : "";
            this.oUsuario.genero = item.genero ? item.genero : "";
            this.oUsuario.cargo = item.cargo ? item.cargo : "";
            this.oUsuario.fecha_ingreso = item.fecha_ingreso
                ? item.fecha_ingreso
                : "";
            this.oUsuario.taller = item.taller ? item.taller : "";
            this.oUsuario.dir = item.dir ? item.dir : "";
            this.oUsuario.fono = item.fono ? item.fono.split("; ") : "";
            this.oUsuario.tipo_personal = item.tipo_personal
                ? item.tipo_personal
                : "";
            this.oUsuario.p_discapacidad = item.p_discapacidad
                ? item.p_discapacidad
                : "";
            this.oUsuario.tipo = item.tipo ? item.tipo : "";
            this.oUsuario.validez_credencial = item.validez_credencial
                ? item.validez_credencial
                : "";
            this.oUsuario.estado = item.estado ? "" + item.estado : "0";
            this.modal_accion = "edit";
            this.muestra_modal = true;
        },

        // Listar Usuarios
        getUsuarios() {
            this.showOverlay = true;
            this.muestra_modal = false;
            let url = main_url + "/admin/usuarios";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios
                .get(url, {
                    params: { per_page: this.per_page },
                })
                .then((res) => {
                    this.showOverlay = false;
                    this.listRegistros = res.data.usuarios;
                    this.totalRows = res.data.total;
                });
        },
        imprimirCredencial(id) {
            let config = {
                responseType: "blob",
            };
            axios
                .post(
                    main_url + "/admin/usuarios/imprimirCredencial/" + id,
                    null,
                    config
                )
                .then((res) => {
                    this.errors = [];
                    this.enviando = false;
                    let pdfBlob = new Blob([res.data], {
                        type: "application/pdf",
                    });
                    let urlReporte = URL.createObjectURL(pdfBlob);
                    window.open(urlReporte);
                });
        },
        eliminaUsuario(id, descripcion) {
            Swal.fire({
                title: "¿Quierés eliminar este registro?",
                html: `<strong>${descripcion}</strong>`,
                showCancelButton: true,
                confirmButtonColor: "#c57a40",
                confirmButtonText: "Si, eliminar",
                cancelButtonText: "No, cancelar",
                denyButtonText: `No, cancelar`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    axios
                        .post(main_url + "/admin/usuarios/" + id, {
                            _method: "DELETE",
                        })
                        .then((res) => {
                            this.getUsuarios();
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
        abreModal(tipo_accion = "nuevo", usuario = null) {
            this.muestra_modal = true;
            this.modal_accion = tipo_accion;
            if (usuario) {
                this.oUsuario = usuario;
            }
        },
        onFiltered(filteredItems) {
            // Trigger pagination to update the number of buttons/pages due to filtering
            this.totalRows = filteredItems.length;
            this.currentPage = 1;
        },
        limpiaUsuario() {
            this.oUsuario.nombre = "";
            this.oUsuario.paterno = "";
            this.oUsuario.materno = "";
            this.oUsuario.ci = "";
            this.oUsuario.ci_exp = "";
            this.oUsuario.fecha_nac = "";
            this.oUsuario.genero = "";
            this.oUsuario.cargo = "";
            this.oUsuario.fecha_ingreso = "";
            this.oUsuario.taller = "";
            this.oUsuario.dir = "";
            this.oUsuario.fono = [];
            this.oUsuario.tipo_personal = "";
            this.oUsuario.p_discapacidad = "";
            this.oUsuario.tipo = "";
            this.oUsuario.foto = null;
            this.oUsuario.validez_credencial = "";
            this.oUsuario.estado = "0";
        },
        formatoFecha(date) {
            return this.$moment(String(date)).format("DD/MM/YYYY");
        },
    },
};
</script>

<style></style>
