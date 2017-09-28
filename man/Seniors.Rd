\name{Seniors}
\docType{data}
\alias{Seniors}
\title{Intergenerationals Experiments }
\description{
  a cross-section

 \emph{number of observations} :  2703

   \emph{country} :  France

\emph{economic topic} : labor and demographic economics

\emph{econometrics topic} : censored and truncated variable

}
\usage{data(Seniors)}
\format{A dataframe containing :
  \describe{
    \item{id}{ individual number of each subject}
    \item{period}{ from 1 to 17}
    \item{session}{ from 1 to 12}
    \item{firm}{ 1 if working subject, 0 otherwise}
    \item{firmx}{ 1 if the firm is X, 0 if the firm is Y}
    \item{order}{ 1 if the treatment with no information on the generation of the group is played first in the Public Good game, 0 otherwise}
    \item{gender}{ 1 if male subject, 0 if female subject}
    \item{manager}{ 1 if the subject is a manager, 0 otherwise}
    \item{student}{ 1 if the subject is a student, 0 otherwise}
    \item{retir}{ 1 if retiree, 0 otherwise}
    \item{senior}{ 1 if the subject is a senior, 0 otherwise}
    \item{seniord}{ 1 if the subject reports s/he is a senior, 0 if junior}
    \item{workingsenior}{ 1 if the subject is a working senior, 0 otherwise}
    \item{workingjunior}{ 1 if the subject is a working junior, 0 otherwise}
    \item{information}{ 1 if information is given on the generation composition of the group, 0 otherwise}
    \item{nbseniors}{ number of seniors in the group, excluding the subject}
    \item{homogend}{ 1 if the group is homogenous in terms of declared generation, 0 otherwise}
    \item{homodgenck}{ 1 if the group is homogenous in terms of declared generation and this is common information, 0 otherwise}
    \item{contribution}{ amount of the contribution to the public good (from 0 to 20)}
    \item{pot}{ amount of the public good (from 0 to 60)}
    \item{potlag}{ amount of the public good in the previous period (from 0 to 60)}
    \item{potimean}{ amount of the public good, excluding the subject's contribution (from 0 to 40)}
    \item{potimeanlag}{ amount of the public good in the previous period, excluding the subject's contribution (from 0 to 40)}
    \item{payoffpggame}{ payoff in the public good game}
    \item{desirnbseniors}{ desired number of seniors co-participants in the Selection treatment (from 0 to 2)}
    \item{invest}{ amount invested in the risky lotery}
    \item{payoffriskgame}{ payoff in the investment game}
    \item{letters}{ 1 if letters are A M F U R I P , 0 if they are OATFNED}
    \item{idicompet}{ individual number of the co-participant in the Task game}
    \item{seniordopponent}{ 1 if the co-participant in the Task game reports s/he is a senior, 0 otherwise}
    \item{seniori}{ 1 if the co-participant in the Task game is a senior}
    \item{option}{ 1 if the subject has chosen the tournament, 0 otherwise}
    \item{option0}{ 1 if the co-participant has chosen the tournament, 0 otherwise}
    \item{twoperstour}{ 1 if both participants have chosen the tournament, 0 otherwise}
    \item{beliefself}{ number of words the subject believes s/he will create}
    \item{beliefseniors}{ number of words the subject believes the seniors will create on average}
    \item{beliefjuniors}{ number of words the subject believes the juniors will create on average}
    \item{beliefsmatchs}{ number of words the subject believes the seniors will create on average when matched with a senior}
    \item{beliefjmatchj}{ number of words the subject believes the juniors will create on average when matched with a junior}
    \item{relatabil}{ 1 if the subject believes s/he can create more words than the generation of his/her co-participant, 0 otherwise}
    \item{performance}{ number of words actually created}
    \item{perfi}{ number of words actually created by the co-participant}
    \item{payoffcompetitiongame}{ payoff in the Task game}
    \item{expesenck}{ 1 if the subject has been informed that s/he was interacting with seniors in the Public Good game, 0 otherwise}
    \item{potlagsenior}{ Amount of the pot in the previous period * the subject is a senior}
    \item{heterogend}{ 1 if the group mixes the two generations, 0 otherwise}
  }
}
\references{
    Charness, Gary  and  Marie-Claire  Villeval (2009) \dQuote{Cooperation and competition in intergenerational experiments in the field and the laboratory}, \emph{American Economic Review}, \bold{99(3)}, 956--978.

}
\seealso{\code{\link{Index.Economics}}, \code{\link{Index.Econometrics}}

}\keyword{datasets}
