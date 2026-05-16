DROP TRIGGER IF EXISTS prevent_status_revert;

DELIMITER //


UPDATE appointments 
SET status = 'Completed' 
WHERE appointment_id = 104;
CREATE TRIGGER prevent_status_revert
BEFORE UPDATE ON appointments
FOR EACH ROW
BEGIN
    IF OLD.status = 'Completed' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Loi: Khong duoc phep thao tac tren lich kham nay!';
    END IF;
END //

DELIMITER ;