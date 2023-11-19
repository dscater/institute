<template>
    <div class="content-wrapper contenedor_banner">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Configurar portal > Banners</h1>
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
                                        <router-link
                                            :to="{ name: 'admin_portal.index' }"
                                            class="btn btn-default btn-flat btn-block"
                                        >
                                            <i class="fa fa-arrow-left"></i>
                                            Volver
                                        </router-link>
                                    </div>
                                    <div class="col-md-3">
                                        <button
                                            v-if="
                                                permisos.includes(
                                                    'banners.create'
                                                )
                                            "
                                            class="btn btn-success btn-flat btn-block"
                                            @click="
                                                abreModal('nuevo');
                                                limpiaBanner();
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
                                                <template #cell(img)="row">
                                                    <img
                                                        :src="row.item.url_img"
                                                        alt="Banner"
                                                        class="img_banner"
                                                    />
                                                </template>
                                                <template #cell(accion)="row">
                                                    <div
                                                        class="row justify-content-between"
                                                    >
                                                        <b-button
                                                            v-if="
                                                                permisos.includes(
                                                                    'banners.edit'
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
                                                                    'banners.destroy'
                                                                )
                                                            "
                                                            size="sm"
                                                            pill
                                                            variant="outline-danger"
                                                            class="btn-flat btn-block"
                                                            title="Eliminar registro"
                                                            @click="
                                                                eliminaBanner(
                                                                    row.item.id,
                                                                    `<h4>¿Está seguro(a) de eliminar el registro con posición ${row.item.posicion}?</h4>`
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
        <FormBanner
            :muestra_modal="muestra_modal"
            :accion="modal_accion"
            :banner="oBanner"
            @close="muestra_modal = false"
            @envioModal="getBanners"
        ></FormBanner>
    </div>
</template>

<script>
import FormBanner from "./formularios/FormBanner.vue";
export default {
    components: {
        FormBanner,
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            url_principal: main_url,
            search: "",
            listRegistros: [],
            showOverlay: false,
            fields: [
                {
                    key: "posicion",
                    label: "Posición Banner",
                    sortable: true,
                },
                { key: "img", label: "Imagen", sortable: true },
                { key: "titulo", label: "Título", sortable: true },
                { key: "descripcion", label: "Descripción", sortable: true },
                { key: "accion", label: "Acción" },
            ],
            loading: true,
            muestra_modal: false,
            modal_accion: "nuevo",
            oBanner: {
                id: 0,
                img: null,
                posicion: "",
                titulo: "",
                descripcion: "",
                muestra_boton: 0,
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
        this.getBanners();
    },
    methods: {
        // Seleccionar Opciones de Tabla
        editarRegistro(item) {
            this.oBanner.id = item.id;
            this.oBanner.url_img = item.url_img ? item.url_img : "";
            this.oBanner.posicion = item.posicion ? item.posicion : "";
            this.oBanner.titulo = item.titulo ? item.titulo : "";
            this.oBanner.descripcion = item.descripcion ? item.descripcion : "";
            this.modal_accion = "edit";
            this.muestra_modal = true;
        },

        // Listar Banners
        getBanners() {
            this.showOverlay = true;
            this.muestra_modal = false;
            let url = main_url + "/admin/banners";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios
                .get(url, {
                    params: { per_page: this.per_page },
                })
                .then((res) => {
                    this.showOverlay = false;
                    this.listRegistros = res.data.banners;
                    this.totalRows = res.data.total;
                });
        },
        eliminaBanner(id, descripcion) {
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
                        .post(main_url + "/admin/banners/" + id, {
                            _method: "DELETE",
                        })
                        .then((res) => {
                            this.getBanners();
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
        abreModal(tipo_accion = "nuevo", banner = null) {
            this.muestra_modal = true;
            this.modal_accion = tipo_accion;
            if (banner) {
                this.oBanner = banner;
            }
        },
        onFiltered(filteredItems) {
            // Trigger pagination to update the number of buttons/pages due to filtering
            this.totalRows = filteredItems.length;
            this.currentPage = 1;
        },
        limpiaBanner() {
            this.oBanner.img = null;
            this.oBanner.posicion = 1;
            this.oBanner.titulo = "";
            this.oBanner.descripcion = "";
        },
        formatoFecha(date) {
            return this.$moment(String(date)).format("DD/MM/YYYY");
        },
    },
};
</script>

<style>
.contenedor_banner .img_banner {
    max-width: 280px;
}
</style>
