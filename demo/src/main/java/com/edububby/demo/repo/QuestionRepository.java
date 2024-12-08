package com.edububby.demo.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.edububby.demo.dto.ProblemSolvedDTO;
import com.edububby.demo.model.QuestionBank;

@Repository
public interface QuestionRepository extends JpaRepository<QuestionBank, Long> {

    @Query("SELECT q FROM QuestionBank q " +
            "JOIN UploadMapping u ON q.qesIdx = u.uploadMapping " +
            "WHERE u.uploadIdx = :uploadIdx AND q.qesLevel = :qesLevel")
    public List<QuestionBank> findQuestionsByUploadIdxAndLevel(Long uploadIdx, int qesLevel);

    @Query(value = """
            SELECT
                qb.qes_type AS qesType,
                COUNT(DISTINCT s.qes_idx) AS questionCount,
                GROUP_CONCAT(DISTINCT s.qes_idx) AS qesIdxList
            FROM
                tb_solving s
            JOIN
                tb_question_bank qb
            ON
                s.qes_idx = qb.qes_idx
            WHERE
                s.user_id = :userId
                AND (s.corr_answer_yn = 'N' OR s.solving_fav = 'Y')
            GROUP BY
                qb.qes_type
            LIMIT 0, 1000
            """, nativeQuery = true)
    public List<Object[]> findQuestionCountWithQesIdxByUserId(String userId);



    @Query("SELECT new com.edububby.demo.dto.ProblemSolvedDTO(" +
           "qb.qesIdx, qb.qesType, qb.qesContent, qb.qesAnswer, qb.qesDt, qb.qesLevel, " +
           "qb.qesSel1, qb.qesSel2, qb.qesSel3, qb.qesSel4, qb.qesSel5, qb.qesExp, " +
           "s.wrongCnt) " +
           "FROM QuestionBank qb " +
           "LEFT JOIN Solving s ON qb.qesIdx = s.qesIdx AND s.userId = :userId " +
           "WHERE qb.qesIdx IN :qesIdxList")
    public List<ProblemSolvedDTO> ProblemSolved(@Param("qesIdxList") List<Long> qesIdxList,@Param("userId") String userId);

    
    
    @Query("""
            SELECT new com.edububby.demo.dto.ProblemSolvedDTO(
                qb.qesIdx, qb.qesType, qb.qesContent, qb.qesAnswer, qb.qesDt, qb.qesLevel,
                qb.qesSel1, qb.qesSel2, qb.qesSel3, qb.qesSel4, qb.qesSel5, qb.qesExp,
                s.wrongCnt
            )
            FROM QuestionBank qb
            JOIN Solving s ON qb.qesIdx = s.qesIdx
            WHERE s.userId = :userId
              AND (s.corrAnswerYn = 'N' OR s.solvingFav = 'Y')
            """)
    List<ProblemSolvedDTO> findProblemsByUserId(@Param("userId") String userId);
    
   
}
