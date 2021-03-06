# Define UI for the application.
problemModuleUI <- function(id) {
  ns <- NS(id)
  fluidPage(
    fluidRow(
      bsCollapse(
        id = ns('demo_dropdown_collapse'),
        multiple = TRUE, 
        open = "↕ Apply filters",
        bsCollapsePanel(
          title = "↕ Apply filters",
          splitLayout(
            cellWidths = c("20%", "20%", "20%", "20%", "20%", "0%"),
            selectInput(
              inputId = ns("activity_level"),
              label = "Activity Level:",
              choices = c("All" = "all",
                          "Under 30 mins" = "under_30_min",
                          "30 mins to 5 hrs" = "30_min_to_5_hr",
                          "Over 5 hrs" = "over_5_hr"),
              selected = "all"),
            selectInput(
              inputId = ns("gender"), 
              label = "Gender:",
              choices = c("All" = "all",
                          "Male" = "male",
                          "Female" = "female",
                          "Other" = "other"),
              selected = "all"),
            selectInput(
              inputId = ns("mode"),
              label = "Registration Status:",
              choices = c("All" = "all",
                          "Verified" = "verified",
                          "Audit" = "audit",
                          "Professional" = "no-id-professional"),
              selected = "all"),
            htmlOutput(ns("moduleSelection")),
            h3(actionButton(ns("reset_filters"), "Reset"), align = "center"),
            tags$head(tags$style(HTML("
                                      .shiny-split-layout > div {
                                      overflow: visible;
                                      }
                                      ")))
          ),
          style = "primary"
        )
      )
    ),

    fluidRow(
      bsCollapse(
        id = ns("overview_panel"),
        multiple = TRUE, #open = "How did students do in each module?",
        open = "↕ How well are students performing in each module?",
        bsCollapsePanel(
          title = "↕ How well are students performing in each module?",
          #tags$p("This plot shows the average grade achieved by students on the multiple choice problems in each module."),
          shinycssloaders::withSpinner(plotOutput(ns("overview_plot"))),
          style = "primary"
        )
      )
    ),

    fluidRow(
      bsCollapse(
        id = ns("bottom_questions_panel"),
        bsCollapsePanel(
          "↕ What are the three hardest problems?",
          shinycssloaders::withSpinner(
            plotOutput(ns("bottom_questions"), height = "600px")
          ),
          style = "primary"
        )
      )
    ),

    fluidRow(
      bsCollapse(
        id = ns("assessment_panel"),
        bsCollapsePanel(
          title = "↕ How are students assessed on Open Response Assessments?",
          shinycssloaders::withSpinner(plotOutput(ns("assessment_plot"))),
          style = "primary"
        )
      )
    ),
    
    fluidRow(
      bsCollapse(
        id = ns("chapter_overview_panel"),
        bsCollapsePanel(
          title = "↕ What is the average score on each problem?",
          shinycssloaders::withSpinner(
            DT::dataTableOutput(ns("chapter_table"))
          ),
          style = "primary"
        )
      )
    )
  )
}
