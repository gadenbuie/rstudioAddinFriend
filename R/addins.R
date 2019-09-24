in_rstudio <- function(rs_fun = "viewer") {
  rstudioapi::hasFun(rs_fun)
}

addin_result <- function(rs_fun, globalVar = NULL) {
  stopifnot(is.character(rs_fun))
  stopifnot(in_rstudio(rs_fun))

  rsFun <- rstudioapi::findFun(rs_fun)

  if (!is.null(globalVar)) {
    message("Saving rstudioapi::", rs_fun, "() to ", globalVar)
    assign(x = globalVar, value = rsFun(), envir = .GlobalEnv)
  } else {
    message(rsFun())
  }
}

get_active_document_context <- function() {
  addin_result("getActiveDocumentContext", ".activeDocumentContext")
}

get_active_project <- function() {
  addin_result("getActiveProject")
}

get_console_editor_context <- function() {
  addin_result("getConsoleEditorContext", ".consoleEditorContext")
}

# rstudioapi::getSourceEditorContext()
get_source_editor_context <- function() {
  addin_result("getSourceEditorContext", ".sourceEditorContext")
}

get_all_contexts <- function() {
  get_active_project()
  get_active_document_context()
  get_console_editor_context()
  get_source_editor_context()
}
