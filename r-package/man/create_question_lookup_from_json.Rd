% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/problem_module.R
\name{create_question_lookup_from_json}
\alias{create_question_lookup_from_json}
\title{Parse a JSON object and return it as a flat dataframe.}
\usage{
create_question_lookup_from_json(name_lookup)
}
\arguments{
\item{name_lookup}{A JSON object contain keys for `id`, `problem`,
`chapter_name`, `chapter_name`, `choices`, `correct_id` and `correct`}
}
\value{
A flat dataframe with the above columns
}
\description{
This function is required to convert the JSON derived from the xbundle XML
  into a format that other dataframes can interact with.
}
