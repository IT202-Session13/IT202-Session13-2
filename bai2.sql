DROP TRIGGER IF EXISTS prevent_status_revert;

DELIMITER //

CREATE TRIGGER prevent_status_revert
BEFORE UPDATE ON appointments
FOR EACH ROW
BEGIN
    IF OLD.status = 'Completed' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Loi: Khong duoc phep thao tac tren lich kham nay!';
    END IF;
END //

DELIMITER ;v