use std::path::PathBuf;

use axum::Router;
use tower_http::{
    services::{ServeDir, ServeFile}
};

#[shuttle_runtime::main]
async fn axum(
    #[shuttle_static_folder::StaticFolder] static_folder: PathBuf,
) -> shuttle_axum::ShuttleAxum {
    let static_path = format!("{}/index.html", static_folder.into_os_string().into_string().unwrap());
    let router =
    Router::new().nest_service(
            "/",
            ServeDir::new("/").not_found_service(ServeFile::new(static_path)));

    Ok(router.into())
}
