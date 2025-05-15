package com.example.doanltweb.dao;

import com.example.doanltweb.dao.db.JDBIConnect;
import com.example.doanltweb.dao.model.Comment;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class CommentDao {
    private Jdbi jdbi;

    public CommentDao() {
        jdbi = JDBIConnect.get();
    }

    // Thêm comment
    public void insertComment(Comment comment) {
        String sql = "INSERT INTO comment(content, star, idUser, idProduct) VALUES (:content, :star, :idUser, :idProduct)";
        jdbi.useHandle(handle -> {
            handle.createUpdate(sql)
                    .bind("content", comment.getContent())
                    .bind("star", comment.getStar())
                    .bind("idUser", comment.getIdUser())
                    .bind("idProduct", comment.getIdProduct())
                    .execute();
        });
    }

    // Lấy danh sách comment theo id sản phẩm
    public List<Comment> getCommentsByProductId(int idProduct) {
        String sql = "SELECT c.*, u.username FROM comment c JOIN user u ON c.idUser = u.id WHERE c.idProduct = :idProduct";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("idProduct", idProduct)
                        .map((rs, ctx) -> new Comment(
                                rs.getInt("id"),
                                rs.getString("content"),
                                rs.getInt("star"),
                                rs.getInt("idUser"),
                                rs.getInt("idProduct"),
                                rs.getString("username")
                        ))
                        .list()
        );
    }
    public static void main(String[] args) {
        CommentDao commentDao = new CommentDao();

        // Tạo comment mới
        Comment newComment = new Comment();
        newComment.setContent("Chất lượng sản phẩm rất tốt!");
        newComment.setStar(5);
        newComment.setIdUser(1);      // ID người dùng phải tồn tại trong bảng `user`
        newComment.setIdProduct(2);   // ID sản phẩm phải tồn tại trong bảng `product`

        // Thêm comment
        commentDao.insertComment(newComment);
        System.out.println("Đã thêm comment thành công.");

        // Lấy danh sách comment theo sản phẩm
        int productId = 2;
        List<Comment> commentList = commentDao.getCommentsByProductId(productId);

        System.out.println("Danh sách đánh giá cho sản phẩm ID = " + productId + ":");
        for (Comment c : commentList) {
            System.out.println("-----------");
            System.out.println("ID: " + c.getId());
            System.out.println("Người dùng: " + c.getUsername());
            System.out.println("Sao: " + c.getStar());
            System.out.println("Nội dung: " + c.getContent());
        }

    }
}
