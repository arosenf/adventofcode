(ns adventofcode.day02-test
  (:require [clojure.test :refer :all]
            [adventofcode.day02 :refer :all]))

(deftest day02-1-test
  (testing "Test day02-1."
    ;; Prepare test data
    (let [file-path "resources/day02/example.txt"]

      ;; Test
      (is (= 2 (solve-02-1 "day02/example.txt"))))))

(deftest day02-2-test
  (testing "Test day02-2."
    ;; Prepare test data
    (let [file-path "resources/day02/example.txt"]

      ;; Test
      (is (= 4 (solve-02-2 "day02/example.txt"))))))
