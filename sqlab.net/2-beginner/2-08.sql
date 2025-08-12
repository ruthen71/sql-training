SELECT
    book_id,
    price * 1.1 AS "tax_included_price"
FROM
    book_sales;
