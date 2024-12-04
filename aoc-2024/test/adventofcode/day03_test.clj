(ns adventofcode.day03-test
  (:require [clojure.test :refer :all]
            [adventofcode.day03 :refer :all]))

(deftest day03-1-test
  (testing "Test day03-1."
    ;; Prepare test data
    (let [file-path "resources/day03/example.txt"]

      ;; Test
      (is (= 161 (read-memory "day03/example.txt" extract-instruction-pairs))))))

(deftest day03-2-test
  (testing "Test day03-2."
    ;; Prepare test data
    (let [file-path "resources/day03/example.txt"]

      ;; Test
      (is (= 48 (read-memory "day03/example.txt" extract-enabled-instruction-pairs))))))
