<?php

namespace App\Controller;

use App\Entity\Matiere;
use App\Entity\Questionnaire;
use App\Entity\studentqcm;
use App\Entity\Students;
use App\Entity\User;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class QCMController extends AbstractController
{
    /**
     * @Route("/qcm/{id}/{idstudent}", name="qcm")
     * @return Response
     */
    public function index($id,$idstudent): Response
    {
        $em = $this->getDoctrine()->getManager();
        $questions = $em->getRepository(Questionnaire::class)->findAll();
//        $studient = $em->getRepository(Students::class)->find($idstudent);
        $studient = $em->getRepository(User::class)->find($idstudent);
        $matiere = $em->getRepository(Matiere::class)->find($id);


        foreach ($questions as $question){
            $qcm = $em->getRepository(studentqcm::class)->findBy(['matiere'=>$matiere->getId(),'user'=>$studient->getId(),'question'=>$question->getId()]);
          if(!$qcm){
              $qcmstudient = new studentqcm();
              $qcmstudient->setMatiere($matiere);
              $qcmstudient->setUser($studient);
              $qcmstudient->setQuestion($question);
              $em->persist($qcmstudient);
          }
           $em->flush();
        }

        $qcms = $em->getRepository(studentqcm::class)->findBy(['matiere'=>$matiere->getId(),'user'=>$studient->getId()]);
        $final=[];
        $i=0;
        foreach ($qcms as $qcm){
            $sujet=$qcm->getQuestion()->getSujet();
//            $note=$qcm->getNote();

            $final[$sujet][]= $qcm;
        }
        return $this->render('pages/qcm.html.twig',['i'=>$i,'qcms'=>$final,"matiere"=>$matiere,'id'=>$matiere->getId(),'stu'=>$studient->getId()]);
//        $qb = $this->getDoctrine()->getManager();
//        $query = $qb->createQueryBuilder('q')
//            ->select('qs.sujet as sujet')
//            ->addselect('q')
//            ->from('App:studentqcm','q')
//            ->join('q.question','qs')
//            ->Where('q.matiere = :m and q.student = :s')
//            ->setParameter('m', $matiere->getId())
//            ->setParameter('s', $studient->getId())
//            ->groupBy('qs.sujet')
//            ->getQuery()
//            ->getResult()
//        ;


    }
    /**
 * @Route("/dashboard/{idstudent}", name="dashboard")
 * @return Response
 */
public function studentPerformanceAnalysis($idstudent): Response
{
    $em = $this->getDoctrine()->getManager();

    // Récupérer tous les résultats des QCM des étudiants
    $studentQcmResults = $em->getRepository(StudentQcm::class)->findAll();

    // Groupement par matière
    $resultsBySubject = [];
    foreach ($studentQcmResults as $result) {
        $subjectId = $result->getMatiere()->getId();
        $resultsBySubject[$subjectId][] = $result;
    }

    // Calcul de la moyenne par matière
    $averagesBySubject = [];
    foreach ($resultsBySubject as $subjectId => $results) {
        $sum = 0;
        $count = count($results);
        foreach ($results as $result) {
            $sum += (int) $result->getNote();
        }
        $subject = $em->getRepository(Matiere::class)->find($subjectId);
        $averagesBySubject[$subject->getName()] = ($count > 0) ? $sum / $count : 0;
    }

    // Groupement par question
    $resultsByQuestion = [];
    foreach ($studentQcmResults as $result) {
        $questionId = $result->getQuestion()->getId();
        $resultsByQuestion[$questionId][] = $result;
    }

    // Calcul du taux de réussite par question
    $passRatesByQuestion = [];
    foreach ($resultsByQuestion as $questionId => $results) {
        $passCount = 0;
        $totalCount = count($results);
        foreach ($results as $result) {
            if ($result->getNote() > 2) {
                $passCount++;
            }
        }
        $passRatesByQuestion[$questionId] = ($totalCount > 0) ? $passCount / $totalCount : 0;
    }

    // Récupérer les résultats d'un étudiant spécifique (remplacez 123 par l'ID de l'étudiant souhaité)
    $studentId = $idstudent;
    $studentResults = $em->getRepository(StudentQcm::class)->findBy(['user' => $studentId]);

    // Calcul du score total de l'étudiant
    $studentTotalScore = 0;
    foreach ($studentResults as $result) {
        $studentTotalScore += $result->getNote();
    }

    // Récupérer les noms de matières
    $matiereRepository = $em->getRepository(Matiere::class);
    $matieres = $matiereRepository->findAll();

    // Créer un tableau avec les noms de matières
    $matiereNames = [];
    foreach ($matieres as $matiere) {
        $matiereNames[] = $matiere->getName();
    }

    // Rendre le template "pages/dashboard.html.twig" avec les données nécessaires
    return $this->render('pages/dashboard.html.twig', [
        'averagesBySubject' => $averagesBySubject,
        'passRatesByQuestion' => $passRatesByQuestion,
        'studentTotalScore' => $studentTotalScore,
        'matiereNames' => $matiereNames
    ]);
}

    /**
     * @Route("/saveqcm/{id}/{stu}", name="save_qcm")
     * @param Request $request
     * @param $id
     * @param $stu
     * @return Response
     */
    public function saveqcm(Request $request, $id, $stu): Response
    {
        $em = $this->getDoctrine()->getManager();
        $data = $request->request->all();
        if($data){
            foreach ($data as $k=>$v){
                $id_question = substr($k, 0, -3);
                $qcm = $em->getRepository(studentqcm::class)->findOneBy(['matiere'=>$id,'user'=>$stu,'question'=>$id_question]);
                $qcm->setNote($v[0]);
                $em->persist($qcm);
                $em->flush();

            }
        }
       return  $this->redirectToRoute('qcm',['id'=>$id,'idstudent'=>$stu]);
    }
}
